DATASET=exp-results
rm -rf $DATASET
mkdir $DATASET

sudo perf stat -o $DATASET/perf-asc-lulesh.out ./lulesh2.0 -i 100
/usr/bin/time -o $DATASET/time-asc-lulesh.out -v ./lulesh2.0 -i 100
ltrace -o $DATASET/mpi-asc-lulesh.out ./lulesh2.0 -i 100

cd $DATASET
cat mpi-asc-lulesh.out | grep "MPI" > mpi2-asc-lulesh.out
rm mpi-asc-lulesh.out
mv mpi2-asc-lulesh.out mpi-asc-lulesh.out

#mpirun -n 2 ./lmp -var t 300 -echo screen -in lj/in.lj
