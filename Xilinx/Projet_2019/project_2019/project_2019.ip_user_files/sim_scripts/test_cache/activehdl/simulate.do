onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+test_cache -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.test_cache xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {test_cache.udo}

run -all

endsim

quit -force
