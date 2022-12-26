if not exist "C:\LAB6" ( mkdir "C:\LAB6" )

wmic os get Caption > "C:\LAB6\wmicCaption.txt" 
wmic os get FreePhysicalMemory,TotalVisibleMemorySize > "C:\LAB6\wmicMemory.txt" 
wmic logicaldisk get name,description > "C:\LAB6\wmicDiscs.txt"