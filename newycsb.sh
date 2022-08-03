rm -rf "/customer_data/badger/"
echo "**************** Workload A Loading data ***************"
./bin/go-ycsb load badger -P workloads/workloada
echo "***************** disk space *********************"
du -sh  "/customer_data/badger/"

echo 3 | sudo tee /proc/sys/vm/drop_caches
sudo blockdev --flushbufs /dev/xvda1
sudo blockdev --flushbufs /dev/xvdf

echo "****************** Workload A Run **************"
./bin/go-ycsb run badger -P workloads/workloada
echo "******************* disk space ********************"
du -sh "/customer_data/badger/"

echo ""
echo ""

rm -rf "/customer_data/pebble/"
echo "**************** Workload A Loading data ***************"
./bin/go-ycsb load pebble -P workloads/workloada
echo "***************** disk space *********************"
du -sh  "/customer_data/pebble/"

echo 3 | sudo tee /proc/sys/vm/drop_caches
sudo blockdev --flushbufs /dev/xvda1
sudo blockdev --flushbufs /dev/xvdf

echo "****************** Workload A Run **************"
./bin/go-ycsb run pebble -P workloads/workloada
echo "******************* disk space ********************"
du -sh "/customer_data/pebble/"

echo ""
echo ""


###########################

rm -rf "/customer_data/badger/"
echo "**************** Workload B Loading data ***************"
./bin/go-ycsb load badger -P workloads/workloadb
echo "***************** disk space *********************"
du -sh  "/customer_data/badger/"

echo 3 | sudo tee /proc/sys/vm/drop_caches
sudo blockdev --flushbufs /dev/xvda1
sudo blockdev --flushbufs /dev/xvdf

echo "****************** Workload B Run **************"
./bin/go-ycsb run badger -P workloads/workloadb
echo "******************* disk space ********************"
du -sh "/customer_data/badger/"

echo ""
echo ""

rm -rf "/customer_data/pebble/"
echo "**************** Workload B Loading data ***************"
./bin/go-ycsb load pebble -P workloads/workloadb
echo "***************** disk space *********************"
du -sh  "/customer_data/pebble/"

echo 3 | sudo tee /proc/sys/vm/drop_caches
sudo blockdev --flushbufs /dev/xvda1
sudo blockdev --flushbufs /dev/xvdf

echo "****************** Workload B Run **************"
./bin/go-ycsb run pebble -P workloads/workloadb
echo "******************* disk space ********************"
du -sh "/customer_data/pebble/"

echo ""
echo ""

###########################

rm -rf "/customer_data/badger/"
echo "**************** Workload C Loading data ***************"
./bin/go-ycsb load badger -P workloads/workloadc
echo "***************** disk space *********************"
du -sh  "/customer_data/badger/"

echo 3 | sudo tee /proc/sys/vm/drop_caches
sudo blockdev --flushbufs /dev/xvda1
sudo blockdev --flushbufs /dev/xvdf

echo "****************** Workload C Run **************"
./bin/go-ycsb run badger -P workloads/workloadc
echo "******************* disk space ********************"
du -sh "/customer_data/badger/"

echo ""
echo ""

rm -rf "/customer_data/pebble/"
echo "**************** Workload C Loading data ***************"
./bin/go-ycsb load pebble -P workloads/workloadc
echo "***************** disk space *********************"
du -sh  "/customer_data/pebble/"

echo 3 | sudo tee /proc/sys/vm/drop_caches
sudo blockdev --flushbufs /dev/xvda1
sudo blockdev --flushbufs /dev/xvdf

echo "****************** Workload C Run **************"
./bin/go-ycsb run pebble -P workloads/workloadc
echo "******************* disk space ********************"
du -sh "/customer_data/pebble/"

echo ""
echo ""


###########################

rm -rf "/customer_data/badger/"
echo "**************** Workload D Loading data ***************"
./bin/go-ycsb load badger -P workloads/workloadd
echo "***************** disk space *********************"
du -sh  "/customer_data/badger/"

echo 3 | sudo tee /proc/sys/vm/drop_caches
sudo blockdev --flushbufs /dev/xvda1
sudo blockdev --flushbufs /dev/xvdf

echo "****************** Workload D Run **************"
./bin/go-ycsb run badger -P workloads/workloadd
echo "******************* disk space ********************"
du -sh "/customer_data/badger/"

echo ""
echo ""

rm -rf "/customer_data/pebble/"
echo "**************** Workload D Loading data ***************"
./bin/go-ycsb load pebble -P workloads/workloadd
echo "***************** disk space *********************"
du -sh  "/customer_data/pebble/"

echo 3 | sudo tee /proc/sys/vm/drop_caches
sudo blockdev --flushbufs /dev/xvda1
sudo blockdev --flushbufs /dev/xvdf

echo "****************** Workload D Run **************"
./bin/go-ycsb run pebble -P workloads/workloadd
echo "******************* disk space ********************"
du -sh "/customer_data/pebble/"

echo ""
echo ""



###########################

rm -rf "/customer_data/badger/"
echo "**************** Workload E Loading data ***************"
./bin/go-ycsb load badger -P workloads/workloade
echo "***************** disk space *********************"
du -sh  "/customer_data/badger/"

echo 3 | sudo tee /proc/sys/vm/drop_caches
sudo blockdev --flushbufs /dev/xvda1
sudo blockdev --flushbufs /dev/xvdf

echo "****************** Workload E Run **************"
./bin/go-ycsb run badger -P workloads/workloade
echo "******************* disk space ********************"
du -sh "/customer_data/badger/"

echo ""
echo ""

rm -rf "/customer_data/pebble/"
echo "**************** Workload E Loading data ***************"
./bin/go-ycsb load pebble -P workloads/workloade
echo "***************** disk space *********************"
du -sh  "/customer_data/pebble/"

echo 3 | sudo tee /proc/sys/vm/drop_caches
sudo blockdev --flushbufs /dev/xvda1
sudo blockdev --flushbufs /dev/xvdf

echo "****************** Workload E Run **************"
./bin/go-ycsb run pebble -P workloads/workloade
echo "******************* disk space ********************"
du -sh "/customer_data/pebble/"

echo ""
echo ""



###########################

rm -rf "/customer_data/badger/"
echo "**************** Workload F Loading data ***************"
./bin/go-ycsb load badger -P workloads/workloadf
echo "***************** disk space *********************"
du -sh  "/customer_data/badger/"

echo 3 | sudo tee /proc/sys/vm/drop_caches
sudo blockdev --flushbufs /dev/xvda1
sudo blockdev --flushbufs /dev/xvdf

echo "****************** Workload F Run **************"
./bin/go-ycsb run badger -P workloads/workloadf
echo "******************* disk space ********************"
du -sh "/customer_data/badger/"

echo ""
echo ""

rm -rf "/customer_data/pebble/"
echo "**************** Workload F Loading data ***************"
./bin/go-ycsb load pebble -P workloads/workloadf
echo "***************** disk space *********************"
du -sh  "/customer_data/pebble/"

echo 3 | sudo tee /proc/sys/vm/drop_caches
sudo blockdev --flushbufs /dev/xvda1
sudo blockdev --flushbufs /dev/xvdf

echo "****************** Workload F Run **************"
./bin/go-ycsb run pebble -P workloads/workloadf
echo "******************* disk space ********************"
du -sh "/customer_data/pebble/"

echo ""
echo ""