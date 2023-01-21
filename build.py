#!/usr/bin/env python3
import sys
import click
from pathlib import Path
import shutil

sys.path.append("../PiRadIP")

import piradip

"""
import importlib.util
import sys
spec = importlib.util.spec_from_file_location("piradip", "../PiRadIP")

foo = importlib.util.module_from_spec(spec)
sys.modules["piradip"] = foo
spec.loader.exec_module(piradip)
"""

from piradip.vivado import PiRadioProject


class SDRv2_Project(PiRadioProject):
    project_name = "SDRv2"
    

@click.group()
@click.pass_context
def cli(ctx):
    pass

    
@cli.command()
@click.pass_context
def create(ctx):
    prj = ctx.obj()
    prj.create()

@cli.command()
@click.pass_context
def generate(ctx):
    prj = ctx.obj()

    prj.vivado.cmd(f"open_project {prj.project_name}")

    prj.vivado.cmd(f"open_bd_design {prj.bd_path}")

    prj.vivado.cmd(f"generate_target -force -verbose all [get_files {prj.bd_path}]")

@cli.command("create-runs")
@click.pass_context
def create_runs(ctx):
    prj = ctx.obj()

    prj.open()
    
    prj.create_runs()
    
@cli.command("ip-status")
@click.pass_context
def ip_status(ctx):
    prj = ctx.obj()

    prj.vivado.cmd(f"open_project {prj.project_name}")

    prj.vivado.cmd(f"open_bd_design {prj.bd_path}")

    print(prj.vivado.cmd(f"report_ip_status"))
    
@cli.command("upgrade-ip")
@click.pass_context
def upgrade_ip(ctx):
    prj = ctx.obj()

    npm = prj.NPM

    npm.load_bd()

@cli.command()
@click.pass_context
def synthesize(ctx):
    prj = ctx.obj()

    #open non-project mode
    npm = prj.NPM

    npm.synthesize()
    
@cli.command()
@click.pass_context
def optimize(ctx, checkpoint):
    prj = ctx.obj()

    #open non-project mode
    npm = prj.NPM

    npm.optimize()

@cli.command()
@click.pass_context
def place(ctx):
    prj = ctx.obj()

    #open non-project mode
    npm = prj.NPM

    npm.place()

@cli.command()
@click.pass_context
def route(ctx):
    prj = ctx.obj()

    #open non-project mode
    npm = prj.NPM

    npm.route()

@cli.command("write-bitstream")
@click.pass_context
def write_bitstream(ctx):
    prj = ctx.obj()

    #open non-project mode
    npm = prj.NPM

    npm.write_bitstream()

@cli.command("write-xsa")
@click.pass_context
def write_xsa(ctx):
    prj = ctx.obj()

    #open non-project mode
    npm = prj.NPM

    npm.write_xsa()
    
@cli.command("dtbo")
@click.pass_context
def dtbo(ctx):
    prj = ctx.obj()
 
    #open non-project mode
    npm = prj.NPM

    npm.dtbo()
    
    
@cli.command()
@click.pass_context
def clean(ctx):
    prj = ctx.obj()

    here = Path(".")

    l = here.glob(f"{prj.project_name}.*")

    for p in l:
        print(f"Removing {p}...")
        if p.is_dir():
            shutil.rmtree(p)
        else:
            p.unlink()

    f = (here / "checkpoints").glob("*.dcp")

    for p in f:
        p.unlink()
    
    
@cli.command()
def build():
    pass


    
    
if __name__ == '__main__':
    cli(obj=SDRv2_Project)
