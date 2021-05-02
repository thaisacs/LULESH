DATASET=exp-results
rm -rf $DATASET
mkdir $DATASET

app=./lulesh2.0 -i 100

perf stat -o $DATASET/perf-asc-lulesh.out $app
/usr/bin/time -o $DATASET/time-asc-lulesh.out -v $app

#ltrace -o $DATASET/mpi-asc-lulesh.out ./lulesh2.0 -i 100
#cd $DATASET
#cat mpi-asc-lulesh.out | grep "MPI" > mpi2-asc-lulesh.out
#rm mpi-asc-lulesh.out
#mv mpi2-asc-lulesh.out mpi-asc-lulesh.out
