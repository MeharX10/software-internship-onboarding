import pytest
from calculator import add, divide

def test_add_basic():
    assert add(2, 3) == 5

def test_add_negative():
    assert add(-2, 1) == -1

def test_divide_basic():
    assert divide(10, 2) == 5

def test_divide_by_zero_raises():
    with pytest.raises(ValueError) as err:
        divide(10, 0)
    assert "divide by zero" in str(err.value).lower()
