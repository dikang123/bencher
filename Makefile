TARGET = bencher
SRCS = $(TARGET).cpp
OBJS = $(TARGET).o
CXX = g++
CFLAGS = -c -Wall -O2 -fno-rtti -fno-exceptions -g
CXXFLAGS = 
DEBUG = 

#Change MYSQL_BASEDIR
MYSQL_BASEDIR = /usr/local/mysql

INCLUDE_DIR = $(MYSQL_BASEDIR)/include/ 
LIB_DIR = -L$(MYSQL_BASEDIR)/lib  -L$(MYSQL_BASEDIR)/lib64/ -L$(MYSQL_BASEDIR)/lib/mysql  -L$(MYSQL_BASEDIR)/lib64/mysql
#LIB_DIR = -L$(MYSQL_BASEDIR)/lib  


LFLAGS = -Wall  -Wl,-rpath -Wl,$(MYSQL_BASEDIR)/lib -g
SYS_LIB = -lrt -lpthread -ldl

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(LFLAGS) $(LIB_DIR) $(OBJS) -lmysqlclient_r $(SYS_LIB) -o $(TARGET)

$(TARGET).o: $(SRCS)
	$(CXX) $(CFLAGS) -I$(MYSQL_BASEDIR)/include -I$(MYSQL_BASEDIR)/include/mysql -I$(INCLUDE_DIR)  $(SRCS)

clean:
	rm -f *.o $(TARGET)

