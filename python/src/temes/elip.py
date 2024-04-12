import math
import random

def volume_intersection(n):
    sqrt50 = math.sqrt(50)
    dins = 0
    for _ in range(n):
        # generar un punt a l'atzar dins del cuboid
        x,y,z = random.uniform(0, sqrt50),random.uniform(0, 10), random.uniform(0, sqrt50)
        # mirar si el punt és dins la intersecció
        x2, y2, z2 = x * x, y * y, z * z
        if x2 + y2 + 2 * z2 <= 100 and 3 * x2 + y2 + z2 <= 150:
            dins += 1
    p = dins / n  # probabilitat de ser dins la intersecció
    return 4000 * p
