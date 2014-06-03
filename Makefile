CXX           = clang++
LINK          = $(CXX)
CXXFLAGS        = -std=c++11 -stdlib=libc++ -Wfatal-errors 
LFLAGS        = -lc++ -lc++abi -O3

default: numeric_test

numeric_test: test/test.cc
	$(CXX) -c $(CXXFLAGS) -Iinclude -o numeric_test.o test/test.cc
	$(LINK) $(LFLAGS) -o numeric_test numeric_test.o

