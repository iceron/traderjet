bool fileExists(string filename) {
   bool res;
   int handle = fileOpen(filename,FILE_READ);
   if (handle>-1) res = true;
   fileClose(handle);
   return(res);
}

