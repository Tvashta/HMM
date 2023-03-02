import os
# Function to rename multiple files
def main():
	i = 0
	path=os.getcwd()
	print path
	for filename in os.listdir(path):
		print filename
		print i
		my_dest ="n" + str(i) + ".asm"
		# my_source =path+"\\" + filename
		my_source =path+"\\" + filename
		my_dest =path +"\\"+ my_dest
		print my_source
		print my_dest
		# rename() function will
		# rename all the files
		if filename == "renameAllFiles.py":
			print filename
		else:
			os.rename(my_source, my_dest)
			i += 1
# Driver Code
if __name__ == '__main__':
	# Calling main() function
	main()