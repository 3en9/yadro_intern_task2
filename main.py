def f(a: int, b:int, c: int, d: int) -> int:
	return ((a-b)*(1+3*c)-4*d)//2

def main():
	with open('output.txt') as file:
		data = file.read().split('\n')
	for row in data:
		if row:
			time, clk, rst_n, a, b, c, d, result = list(map(int,map(lambda x: x.split('=')[1], row.split('|'))))
			if rst_n == 1:
				if f(a, b, c, d) != result:
					print('error', a, b, c, d)

if __name__=='__main__':
	main()
	print('all tests checked')
