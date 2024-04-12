from typing import TypeVar, Generic
import heapq

T = TypeVar('T')


class PriorityQueue(Generic[T]):
    """Minimum Priority Queue class with textbook operations."""

    _heap: list[T]

    def __init__(self) -> None:
        """Create an empty priority queue."""
        self._heap = []

    def push(self, x: T) -> None:
        """Push an element x to the priority queue."""
        heapq.heappush(self._heap, x)

    def pop(self) -> T:
        """Pop the minimum element of the priority queue and return it. The priority queue cannot be empty."""
        return heapq.heappop(self._heap)

    def top(self) -> T:
        """Return the minimum element of the priority queue. The priority queue cannot be empty."""
        return self._heap[0]

    def size(self) -> int:
        """Return the number of elements in the priority queue."""
        return len(self._heap)

    def empty(self) -> bool:
        """Tell wether the priority queue is empty or not."""
        return self.size() == 0
