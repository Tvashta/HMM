import glob
import os

def createExe(fileName):
	exeFileName = fileName
	masmPath = "C:\\masm\\8086\\"
	os.system(masmPath+"masm "+exeFileName+", , ;\n")
	os.system(masmPath+"link "+exeFileName+", , ;\n")
	os.system("del *.OBJ \n") # clean up unnecessary remnants
	os.system("del *.LST \n")
	os.system("del *.MAP \n")

def findFiles():
	filesList=[]
	for name in glob.glob('*.asm'): 
		filesList.append(name[:-4])
	filesList.sort()
	print(filesList)
	for file in filesList:
		createExe(file)

findFiles()