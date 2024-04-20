echo "BADGER 0"
rm -rf /home/ubuntu/bench-data/badger
./bin/go-ycsb load badger -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadg__1
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloade

echo "PEBBLE 0"
rm -rf /home/ubuntu/bench-data/pebble
./bin/go-ycsb load pebble -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadg__1
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloade

echo "BADGER 0"
rm -rf /home/ubuntu/bench-data/badger
./bin/go-ycsb load badger -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadg__25
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloade

echo "PEBBLE 0"
rm -rf /home/ubuntu/bench-data/pebble
./bin/go-ycsb load pebble -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadg__25
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloade

echo "BADGER 0"
rm -rf /home/ubuntu/bench-data/badger
./bin/go-ycsb load badger -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadg__50
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloade

echo "PEBBLE 0"
rm -rf /home/ubuntu/bench-data/pebble
./bin/go-ycsb load pebble -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadg__50
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloade

echo "BADGER 0"
rm -rf /home/ubuntu/bench-data/badger
./bin/go-ycsb load badger -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadg__75
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloade

echo "PEBBLE 0"
rm -rf /home/ubuntu/bench-data/pebble
./bin/go-ycsb load pebble -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadg__75
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloade

echo "BADGER 0"
rm -rf /home/ubuntu/bench-data/badger
./bin/go-ycsb load badger -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadg__100
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloade

echo "PEBBLE 0"
rm -rf /home/ubuntu/bench-data/pebble
./bin/go-ycsb load pebble -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadg__100
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloade


echo "**********NEXT CHART 1*************"

echo "BADGER 1"
rm -rf /home/ubuntu/bench-data/badger
./bin/go-ycsb load badger -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadg_1_1
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloade

echo "PEBBLE 1"
rm -rf /home/ubuntu/bench-data/pebble
./bin/go-ycsb load pebble -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadg_1_1
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloade

echo "BADGER 1"
rm -rf /home/ubuntu/bench-data/badger
./bin/go-ycsb load badger -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadg_1_25
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloade

echo "PEBBLE 1"
rm -rf /home/ubuntu/bench-data/pebble
./bin/go-ycsb load pebble -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadg_1_25
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloade

echo "BADGER 1"
rm -rf /home/ubuntu/bench-data/badger
./bin/go-ycsb load badger -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadg_1_50
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloade

echo "PEBBLE 1"
rm -rf /home/ubuntu/bench-data/pebble
./bin/go-ycsb load pebble -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadg_1_50
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloade

echo "BADGER 1"
rm -rf /home/ubuntu/bench-data/badger
./bin/go-ycsb load badger -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadg_1_75
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloade

echo "PEBBLE 1"
rm -rf /home/ubuntu/bench-data/pebble
./bin/go-ycsb load pebble -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadg_1_75
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloade

echo "BADGER 1"
rm -rf /home/ubuntu/bench-data/badger
./bin/go-ycsb load badger -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadg_1_100
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloade

echo "PEBBLE 1"
rm -rf /home/ubuntu/bench-data/pebble
./bin/go-ycsb load pebble -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadg_1_100
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloade

echo "**********NEXT CHART 2*************"

echo "BADGER 2"
rm -rf /home/ubuntu/bench-data/badger
./bin/go-ycsb load badger -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadg_2_1
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloade

echo "PEBBLE 2"
rm -rf /home/ubuntu/bench-data/pebble
./bin/go-ycsb load pebble -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadg_2_1
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloade

echo "BADGER 2"
rm -rf /home/ubuntu/bench-data/badger
./bin/go-ycsb load badger -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadg_2_25
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloade

echo "PEBBLE 2"
rm -rf /home/ubuntu/bench-data/pebble
./bin/go-ycsb load pebble -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadg_2_25
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloade

echo "BADGER 2"
rm -rf /home/ubuntu/bench-data/badger
./bin/go-ycsb load badger -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadg_2_50
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloade

echo "PEBBLE 2"
rm -rf /home/ubuntu/bench-data/pebble
./bin/go-ycsb load pebble -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadg_2_50
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadc


/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloade

echo "BADGER 2"
rm -rf /home/ubuntu/bench-data/badger
./bin/go-ycsb load badger -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadg_2_75
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloade

echo "PEBBLE 2"
rm -rf /home/ubuntu/bench-data/pebble
./bin/go-ycsb load pebble -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadg_2_75
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloade

echo "BADGER 2"
rm -rf /home/ubuntu/bench-data/badger
./bin/go-ycsb load badger -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadg_2_100
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run badger -P workloads/workloade

echo "PEBBLE 2"
rm -rf /home/ubuntu/bench-data/pebble
./bin/go-ycsb load pebble -P workloads/workloada
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadg_2_100
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloadc
/usr/bin/time -v ./bin/go-ycsb run pebble -P workloads/workloade