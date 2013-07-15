void fileClose(int handle)  {
   FileClose(handle);
}

void fileDelete(string filename)  {
   FileDelete(filename);
}

void fileFlush(int handle)  {
   FileFlush(handle);
}

bool fileIsEnding(int handle)  {
   return(FileIsEnding(handle));
}

bool fileIsLineEnding(int handle)  {
   return(FileIsLineEnding(handle));
}

int fileOpen(string filename,int mode,string delim=";") {
   return(FileOpen(filename,mode,delim));
}

int fileOpenHistory(string filename,int mode,string delim=";") {
   return(FileOpenHistory(filename,mode,delim));
}

int fileReadArrayString(int handle,string& arr[],int start,int count)  {
   return(FileReadArray(handle,arr,start,count));
}

int fileReadArrayDouble(int handle,double& arr[],int start,int count)  {
   return(FileReadArray(handle,arr,start,count));
}

int fileReadArrayInt(int handle,int& arr[],int start,int count)  {
   return(FileReadArray(handle,arr,start,count));
}

int fileReadArrayDateTime(int handle,datetime& arr[],int start,int count)  {
   return(FileReadArray(handle,arr,start,count));
}

int fileReadArrayColor(int handle,color& arr[],int start,int count)  {
   return(FileReadArray(handle,arr,start,count));
}

int fileReadArrayBool(int handle,bool& arr[],int start,int count)  {
   return(FileReadArray(handle,arr,start,count));
}

double fileReadDouble(int handle,int size=DOUBLE_VALUE) {
   return(FileReadDouble(handle,size));
}

double fileReadInteger(int handle,int size=DOUBLE_VALUE) {
   return(FileReadInteger(handle,size));
}

double fileReadNumber(int handle) {
   return(FileReadNumber(handle));
}

string fileReadString(int handle,int len=0)  {
   return(FileReadString(handle,len));
}

bool fileSeek(int handle,int offset,int origin)   {
   return(FileSeek(handle,offset,origin));
}

int fileSize(int handle)   {
   return(FileSize(handle));
}

int fileTell(int handle)   {
   return(FileTell(handle));
}

int fileWrite(int handle,string v1="",string v2="",string v3="",string v4="",string v5="",string v6="",string v7="",string v8="",string v9="",string v10="",
              string v11="",string v12="",string v13="",string v14="",string v15="",string v16="",string v17="",string v18="",string v19="",string v20="")  {
   return(FileWrite(handle,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,v14,v15,v16,v17,v18,v19,v20));
}

int fileWriteArrayString(int handle,string& arr[],int start,int count) {
   return(FileWriteArray(handle,arr,start,count));
}

int fileWriteArrayDouble(int handle,double& arr[],int start,int count) {
   return(FileWriteArray(handle,arr,start,count));
}

int fileWriteArrayInteger(int handle,int& arr[],int start,int count) {
   return(FileWriteArray(handle,arr,start,count));
}

int fileWriteArrayDateTime(int handle,datetime& arr[],int start,int count) {
   return(FileWriteArray(handle,arr,start,count));
}

int fileWriteArrayColor(int handle,color& arr[],int start,int count) {
   return(FileWriteArray(handle,arr,start,count));
}

int fileWriteArrayBool(int handle,bool& arr[],int start,int count) {
   return(FileWriteArray(handle,arr,start,count));
}

int fileWriteDouble(int handle,double value,int size=DOUBLE_VALUE)   {
   return(FileWriteDouble(handle,value,size));
}

int fileWriteInteger(int handle,int value,int size=LONG_VALUE)   {
   return(FileWriteInteger(handle,value,size));
}

int fileWriteString(int handle,int value,int len)   {
   return(FileWriteString(handle,value,len));
}

bool fileExists(string filename) {
   bool res;
   int handle = FileOpen(filename,FILE_READ);
   if (handle>-1) res = true;
   FileClose(handle);
   return(res);
}

