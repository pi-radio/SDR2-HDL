START_DIR=$(pwd)

cd ../PiRadIP
./buildlib.py build
vivado -nolog -nojournal -mode batch -source generate_all.tcl


cd ${START_DIR}
vivado -nolog -nojournal -mode batch -source build.tcl
