import unittest
import numpy

from main import is_unicolor
from main import compress


class Testfunctions(unittest.TestCase):
    def test_unicolor(self):
        self.assertTrue(is_unicolor([[0,0,0]]))
        self.assertTrue(is_unicolor([[0,0,0],[0,0,0]]))
        self.assertTrue(is_unicolor([[1,1,1],[1,1,1]]))

    def test_unicolor_false(self):
        self.assertFalse(is_unicolor([[1,0,0]]))
        self.assertFalse(is_unicolor([[1,0,0], [1,1,1]]))

    def test_unicolor_subset(self):
        img = numpy.array([[1,1,1],[0,1,1]])
        self.assertTrue(is_unicolor(img[0:1,0:2]))

        self.assertFalse(is_unicolor(img))

    def test_do(self):
        img = numpy.array([[0]])
        self.assertEqual("10", compress(img))

        img = numpy.array([[1]])
        self.assertEqual("11", compress(img))

