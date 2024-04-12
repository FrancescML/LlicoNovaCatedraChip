from typing import TypeVar, Generic


T = TypeVar('T')


class Stack(Generic[T]):
    """Stack class with textbook operations."""

    _lst: list[T]

    def __init__(self) -> None:
        """Create an empty stack."""
        self._lst = []

    def push(self, x: T) -> None:
        """Push an element x to the stack."""
        self._lst.append(x)

    def pop(self) -> T:
        """Pop the element at the top of the stack and return it. The stack cannot be empty."""
        return self._lst.pop()

    def top(self) -> T:
        """Return the element at the top of the stack. The stack cannot be empty."""
        return self._lst[-1]

    def size(self) -> int:
        """Return the number of elements in the stack."""
        return len(self._lst)

    def empty(self) -> bool:
        """Tell wether the stack is empty or not."""
        return self.size() == 0
