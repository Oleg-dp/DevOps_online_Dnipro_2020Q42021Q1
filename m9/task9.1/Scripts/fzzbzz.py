import fzzbzz_module
import unittest

class FizzBuzzTests(unittest.TestCase):
    def test_fizz(self):
        number=6
        result = fzzbzz_module.fzzbzz(number)
        self.assertEqual(result, 'Fizz')
    def test_buzz(self):
        number=10
        result = fzzbzz_module.fzzbzz(number)
        self.assertEqual(result, 'Buzz')
    def test_fizzbuzz(self):
        number=15
        result = fzzbzz_module.fzzbzz(number)
        self.assertEqual(result, 'FizzBuzz')

if __name__ == '__main__':
    unittest.main()
