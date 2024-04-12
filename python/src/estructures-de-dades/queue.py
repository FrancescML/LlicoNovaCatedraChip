from typing import TypeVar, Generic
from collections import deque

T = TypeVar('T')


class Queue(Generic[T]):
    """Queue class with textbook operations."""

    _dq: deque[T]

    def __init__(self) -> None:
        """Create an empty queue."""
        self._dq = deque[T]()

    def push(self, x: T) -> None:
        """Push an element x to the queue."""
        self._dq.append(x)

    def pop(self) -> T:
        """Pop the first element of the queue and return it. The queue cannot be empty."""
        return self._dq.popleft()

    def top(self) -> T:
        """Return the first element of the queue. The queue cannot be empty."""
        return self._dq[-1]

    def size(self) -> int:
        """Return the number of elements in the queue."""
        return len(self._dq)

    def empty(self) -> bool:
        """Tell wether the queue is empty or not."""
        return self.size() == 0
