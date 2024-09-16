#
# Goncalo's Generic Makefile -- Compiles and installs a Generic Goncalo Tool
# (c) 2000-2007 Goncalo Abecasis
#

# version information
TOOL = metal

# default installation directory
INSTALLDIR=/usr/local/bin

# default C++ compiler
CXX=g++ 

# default compilation flags are 
#
# CFLAGS=-O2 -I./libsrc/ -I./pdf/
# 
# The following special options may also be added to the default
# 
#      Option                        Effect
#      -D_FILE_OFFSET_BITS=64        Enables support for swapfiles larger
#                                    than 2GB on supported systems (tested
#                                    on Linux)
#      -D__USE_LONG_INT              Enables support for markers with up
#                                    to 64 alleles (default is 32). Tested
#                                    on systems where gcc supports the long
#                                    long data type and on Windows.
# 
CFLAGS=-O2 -I./libsrc -I./pdf  -D_FILE_OFFSET_BITS=64

# executable file names and locations
BINDIR = executables
TARGET = $(BINDIR)/$(TOOL)
EXECUTABLES = $(TARGET)

# Source File Set
# For best results, consider editing this manually ...
TOOLSRC = $(TOOL)/Main.cpp

# Utility Library File Set
LIBFILE = libsrc/lib-goncalo.a
LIBMAIN = libsrc/BasicHash libsrc/Error libsrc/FortranFormat \
 libsrc/GenotypeLists libsrc/IntArray libsrc/InputFile libsrc/Hash \
 libsrc/LongArray libsrc/Kinship libsrc/KinshipX  libsrc/MapFunction \
 libsrc/MathCholesky libsrc/MathDeriv libsrc/MathFloatVector \
 libsrc/MathGenMin libsrc/MathGold libsrc/MathMatrix libsrc/MathStats \
 libsrc/MathNormal libsrc/MathSVD libsrc/MathVector \
 libsrc/MemoryInfo libsrc/MiniDeflate \
 libsrc/Parameters libsrc/Pedigree libsrc/PedigreeAlleleFreq \
 libsrc/PedigreeDescription libsrc/PedigreeFamily libsrc/PedigreeGlobals \
 libsrc/PedigreePerson libsrc/QuickIndex libsrc/Random libsrc/Sort \
 libsrc/StringArray libsrc/StringBasics libsrc/StringMap \
 libsrc/StringHash libsrc/TraitTransformations
LIBPED = libsrc/PedigreeLoader libsrc/PedigreeTwin libsrc/PedigreeTrim
LIBSRC = $(LIBMAIN:=.cpp) $(LIBPED:=.cpp)
LIBHDR = $(LIBMAIN:=.h) libsrc/Constant.h \
 libsrc/MathConstant.h libsrc/PedigreeAlleles.h libsrc/LongInt.h
LIBOBJ = $(LIBSRC:.cpp=.o)
 
# PDF Library File Sets
PDFLIB = pdf/libpdf.a
PDFFILES = pdf/PDF pdf/PDFfont pdf/PDFinfo pdf/PDFpage
PDFSRC = $(PDFFILES:=.cpp)
PDFHDR = $(PDFFILES:=.h)
PDFOBJ = $(PDFFILES:=.o)

# private parameters
FETCHDIR=$(HOME)/code
DISTRIBDIR=$(HOME)/code/distrib/generic-$(TOOL)

# helpful screen listing available options
help : 
	@echo "Generic Source Distribution"
	@echo " "
	@echo "This Makefile will compile and install" $(TOOL) "on your system"
	@echo " "
	@echo "Type...           To..."
	@echo "make help         Display this help screen"
	@echo "make all          Compile everything "
	@echo "make install      Install binaries in $(INSTALLDIR)"
	@echo "make install INSTALLDIR=directory_for_binaries"
	@echo "                  Install binaries in directory_for_binaries"
	@echo "make clean        Delete temporary files"

# make everything
all : $(EXECUTABLES)

$(EXECUTABLES) : $(BINDIR)

$(BINDIR) :
	mkdir -p $(BINDIR)

# dependencies for executables
$(TARGET) : $(LIBFILE) $(TOOLSRC) $(PDFLIB)
	$(CXX) $(CFLAGS) -o $@ -include version/VersionInfo.h $(TOOL)/*.cpp $(PDFLIB) $(LIBFILE) -lm -lz

$(LIBFILE) : $(LIBOBJ) $(LIBHDR)
	ar -cr $@ $(LIBOBJ)
	ranlib $@

$(PDFLIB) : $(PDFOBJ)
	ar -cr $@ $(PDFOBJ)
	ranlib $@

$(LIBOBJ) : $(LIBHDR)

$(PDFOBJ) : $(PDFHDR)

clean :
	-rm -f */*.a */*.o $(EXECUTABLES) 

install : all $(INSTALLDIR)
	@echo " "
	@echo Installing to directory $(INSTALLDIR)
	@echo To select a different directory, run
	@echo " "
	@echo make install INSTALLDIR=your_preferred_dir
	@echo " "
	cp $(EXECUTABLES) $(INSTALLDIR)

$(INSTALLDIR) :
	@echo " "
	@echo Creating directory $(INSTALLDIR)
	@echo " "
	@mkdir -p $(INSTALLDIR)

new-version :
	mkdir -p $(DISTRIBDIR) $(DISTRIBDIR)/$(TOOL)
	mkdir -p $(DISTRIBDIR)/libsrc $(DISTRIBDIR)/pdf $(DISTRIBDIR)/examples
	cp ChangeLog LICENSE.twister README $(DISTRIBDIR)
	cp Makefile $(DISTRIBDIR)
	cp -R examples $(DISTRIBDIR)
	
fetch : 
	cd $(FETCHDIR) ; tcsh -c "cp $(TOOL)/*.{h,cpp} $(DISTRIBDIR)/$(TOOL)"
	cd $(FETCHDIR) ; cp $(LIBSRC) $(LIBHDR) $(DISTRIBDIR)/libsrc
	cd $(FETCHDIR) ; cp $(PDFSRC) $(PDFHDR) $(DISTRIBDIR)/pdf
	cd $(DISTRIBDIR) ; csh ../stamp Goncalo Generic
	mkdir -p version 
	echo "#ifndef __VERSION_INFO_H__" >  version/VersionInfo.h
	echo "#define __VERSION_INFO_H__" >> version/VersionInfo.h
	echo "\n"                         >> version/VersionInfo.h
	echo "#ifndef VERSION "           >> version/VersionInfo.h
	echo "#define VERSION "'"'`date +%F`'"' >> version/VersionInfo.h
	echo "#endif"                     >> version/VersionInfo.h	
	echo "\n"                         >> version/VersionInfo.h
	echo "#endif"                     >> version/VersionInfo.h	
	echo "\n"                         >> version/VersionInfo.h

.c.o :
	$(CXX) $(CFLAGS) -o $@ -c $*.c

.cpp.o : 
	$(CXX) $(CFLAGS) -o $@ -c $*.cpp -DVERSION=\"$(VERSION)\"

archive : clean
	mkdir -p generic-$(TOOL)
	cp -R LICENSE.twister README Makefile ChangeLog generic-$(TOOL)
	cp -R libsrc pdf examples version $(TOOL) generic-$(TOOL)
	tar -cvf generic-$(TOOL)-`date +%F`.tar generic-$(TOOL) 
	gzip -f --best generic-$(TOOL)-`date +%F`.tar
	rm -rf generic-$(TOOL)

distrib : $(EXECUTABLES)
	rm -rf generic-$(TOOL)
	mkdir -p generic-$(TOOL)
	cp -R LICENSE.twister README ChangeLog $(EXECUTABLES) examples generic-$(TOOL)
	tar -cvf `uname`-$(TOOL).tar generic-$(TOOL)
	gzip -f `uname`-$(TOOL).tar
	rm -rf generic-$(TOOL)

windowszip : $(EXECUTABLES)
	mkdir -p generic-$(TOOL)
	cp -R LICENSE.twister README ChangeLog $(EXECUTABLES) examples  generic-$(TOOL)
	echo '@ECHO OFF' > generic-$(TOOL)/STARTHERE.bat
	echo 'CMD /K "SET PATH=%CD%;%PATH%"' >> generic-$(TOOL)/STARTHERE.bat
	zip -r Windows-$(TOOL).zip generic-$(TOOL)
	rm -rf generic-$(TOOL)


.SUFFIXES : .cpp .c .o .X.o $(SUFFIXES)

