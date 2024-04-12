import sys

base = sys.argv[1]

inp = open(base + '.inp')
out = open(base + '.out')

mat_inp = [line.split() for line in inp.readlines()]
mat_out = [line.split() for line in out.readlines()]

svg_inp = ''
svg_out = ''

svg_inp = ''
for i in range(9):
    for j in range(9):
        if mat_inp[i][j] != '.':
            svg_inp = svg_inp + f'''
            <rect x="{j*80+50}" y="{i*80+50}" width="80" height="80" style="stroke:black; stroke-width:2; fill:lightgray"/>
            <text x="{j*80+90}" y="{i*80+90}" style="text-anchor:middle; dominant-baseline:middle; font-family:Helvetica; font-size:32px; fill:black">{mat_inp[i][j]}</text>
            '''
            svg_out = svg_out + f'''
            <rect x="{j*80+50}" y="{i*80+50}" width="80" height="80" style="stroke:black; stroke-width:2; fill:lightgray"/>
            <text x="{j*80+90}" y="{i*80+90}" style="text-anchor:middle; dominant-baseline:middle; font-family:Helvetica; font-size:32px; fill:black">{mat_inp[i][j]}</text>
            '''
        else:
            svg_inp = svg_inp + f'''
            <rect x="{j*80+50}" y="{i*80+50}" width="80" height="80" style="stroke:black; stroke-width:2; fill:white"/>
            '''
            svg_out = svg_out + f'''
            <rect x="{j*80+50}" y="{i*80+50}" width="80" height="80" style="stroke:black; stroke-width:2; fill:white"/>
            <text x="{j*80+90}" y="{i*80+90}" style="text-anchor:middle; dominant-baseline:middle; font-family:Helvetica; font-size:32px; fill:black">{mat_out[i][j]}</text>
            '''

open(base + ".inp.svg", "w").write(f"""<?xml version="1.0"?>
<svg width="800" height="800" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
    {svg_inp}
    <rect x="50" y="50" width="240" height="240" style="stroke:black; stroke-width:5; fill-opacity:0.0"/>
<rect x="290" y="50" width="240" height="240" style="stroke:black; stroke-width:5; fill-opacity:0.0"/>
<rect x="530" y="50" width="240" height="240" style="stroke:black; stroke-width:5; fill-opacity:0.0"/>
<rect x="50" y="290" width="240" height="240" style="stroke:black; stroke-width:5; fill-opacity:0.0"/>
<rect x="290" y="290" width="240" height="240" style="stroke:black; stroke-width:5; fill-opacity:0.0"/>
<rect x="530" y="290" width="240" height="240" style="stroke:black; stroke-width:5; fill-opacity:0.0"/>
<rect x="50" y="530" width="240" height="240" style="stroke:black; stroke-width:5; fill-opacity:0.0"/>
<rect x="290" y="530" width="240" height="240" style="stroke:black; stroke-width:5; fill-opacity:0.0"/>
<rect x="530" y="530" width="240" height="240" style="stroke:black; stroke-width:5; fill-opacity:0.0"/>
</svg>
""")

open(base + ".out.svg", "w").write(f"""<?xml version="1.0"?>
<svg width="800" height="800" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
    {svg_out}
    <rect x="50" y="50" width="240" height="240" style="stroke:black; stroke-width:5; fill-opacity:0.0"/>
<rect x="290" y="50" width="240" height="240" style="stroke:black; stroke-width:5; fill-opacity:0.0"/>
<rect x="530" y="50" width="240" height="240" style="stroke:black; stroke-width:5; fill-opacity:0.0"/>
<rect x="50" y="290" width="240" height="240" style="stroke:black; stroke-width:5; fill-opacity:0.0"/>
<rect x="290" y="290" width="240" height="240" style="stroke:black; stroke-width:5; fill-opacity:0.0"/>
<rect x="530" y="290" width="240" height="240" style="stroke:black; stroke-width:5; fill-opacity:0.0"/>
<rect x="50" y="530" width="240" height="240" style="stroke:black; stroke-width:5; fill-opacity:0.0"/>
<rect x="290" y="530" width="240" height="240" style="stroke:black; stroke-width:5; fill-opacity:0.0"/>
<rect x="530" y="530" width="240" height="240" style="stroke:black; stroke-width:5; fill-opacity:0.0"/>
</svg>
""")
