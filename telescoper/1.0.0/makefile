CC=g++

#choose options
#add back -O3 -- to both lines below simultaneously or not. 
TELE_VAL=101
CFLAGS=-c -O3 -m64 -g -pg -DTELE_L=$(TELE_VAL) -I /usr/include/boost/ #these are used in intermediate step
FINALFLAGS=-g -O3 -pg -m64  -I /usr/include/boost/ #these are used in making the final executable
all: Telescoper$(TELE_VAL) preprocessData$(TELE_VAL)

OBJS = main.o ReadCorrection.o ReadOpsVar.o ReadType.o Unitig2.o ErrFreeAdjacencies.o Path.o Segment.o DistParams.o SangerReads2.o SegmentPath.o ReadStorageHelper.o RowInfo.o #OtherContigs.o

PREOBJ = preprocessData.cpp ReadStorageHelper.cpp

Telescoper$(TELE_VAL): $(OBJS) 
	$(CC) $(FINALFLAGS) $(OBJS) -o Telescoper$(TELE_VAL)

preprocessData$(TELE_VAL): $(PREOBJ) ReadOpsVar.hpp ReadStorageVar.hpp DNASeq.hpp ReadStorageVar.cpp
	$(CC) $(FINALFLAGS) -DTELE_L=$(TELE_VAL) $(PREOBJ) -o preprocessData$(TELE_VAL)

RowInfo.o: RowInfo.hpp RowInfo.cpp Segment.hpp
	$(CC) $(CFLAGS) RowInfo.cpp

main.o: CommandParse.hpp DistParams.hpp main.cpp ReadStorageVar.hpp ReadStorageVar.cpp ReadOpsVar.hpp ReadType.hpp ErrFreeAdjacencies.hpp Unitig2.hpp Path.hpp Segment.hpp SegmentPath.hpp SangerReads2.hpp DNASeq.hpp
	$(CC) $(CFLAGS) main.cpp

ReadStorageHelper.o: ReadStorageHelper.cpp ReadStorageHelper.hpp GenericFunctions.hpp
	$(CC) $(CFLAGS) ReadStorageHelper.cpp

ReadCorrection.o: ReadCorrection.hpp ReadCorrection.cpp ReadType.hpp ReadOpsVar.hpp ReadStorageVar.hpp ReadStorageVar.cpp GenUtils.hpp ReadKmer.hpp DistParams.hpp DNASeq.hpp 
	$(CC) $(CFLAGS) ReadCorrection.cpp

ReadOpsVar.o: ReadOpsVar.cpp ReadOpsVar.hpp DNASeq.hpp
	$(CC) $(CFLAGS) ReadOpsVar.cpp
ReadType.o: ReadType.cpp ReadType.hpp
	$(CC) $(CFLAGS) ReadType.cpp
Unitig2.o: Unitig2.cpp ReadCorrection.hpp Unitig2.hpp GenUtils.hpp ReadType.hpp NeighbType.hpp
	$(CC) $(CFLAGS) Unitig2.cpp
ErrFreeAdjacencies.o: ErrFreeAdjacencies.cpp ErrFreeAdjacencies.hpp ReadType.hpp ReadOpsVar.hpp ReadStorageVar.hpp ReadStorageVar.cpp DistParams.hpp  GenUtils.hpp ReadKmer.hpp DNASeq.hpp
	$(CC) $(CFLAGS) ErrFreeAdjacencies.cpp

Path.o: Path.hpp Path.cpp ReadType.hpp ReadOpsVar.hpp ReadStorageVar.hpp ReadStorageVar.cpp ErrFreeAdjacencies.hpp DistParams.hpp GenUtils.hpp Unitig2.hpp DNASeq.hpp
	$(CC) $(CFLAGS) Path.cpp
SangerReads2.o: SangerReads2.cpp Segment.hpp SangerReads2.hpp GenUtils.hpp 
	$(CC) $(CFLAGS) SangerReads2.cpp 

Segment.o: RowInfo.hpp Segment.cpp Segment.hpp ReadType.hpp ReadCorrection.hpp ReadOpsVar.hpp Unitig2.hpp ReadStorageVar.hpp ReadStorageVar.cpp ErrFreeAdjacencies.hpp Path.hpp SangerReads2.hpp GenUtils.hpp DistParams.hpp  DNASeq.hpp
	$(CC) $(CFLAGS) Segment.cpp

SegmentPath.o: SegmentPath.hpp SegmentPath.cpp Segment.hpp NeighbType.hpp
	$(CC) $(CFLAGS) SegmentPath.cpp

DistParams.o: DistParams.cpp DistParams.hpp
	$(CC) $(CFLAGS) DistParams.cpp



clean:
	rm *.o 
