import chess
import chess.svg
import chess.variant

board = chess.Board("8/8/8/8/8/8/8/8 w - - 0 1")

svg = chess.svg.board(
    board,
    size=250,
    coordinates=False,
    # fill=dict.fromkeys(board.attacks(chess.D4), "#ddddddcc"),
    arrows=[
        chess.svg.Arrow(chess.A2, chess.B1, color="#cc0000cc"),
        chess.svg.Arrow(chess.A3, chess.C1, color="#cc0000cc"),
        chess.svg.Arrow(chess.A4, chess.D1, color="#cc0000cc"),
        chess.svg.Arrow(chess.A5, chess.E1, color="#cc0000cc"),
        chess.svg.Arrow(chess.A6, chess.F1, color="#cc0000cc"),
        chess.svg.Arrow(chess.A7, chess.G1, color="#cc0000cc"),
        chess.svg.Arrow(chess.A8, chess.H1, color="#cc0000cc"),
        chess.svg.Arrow(chess.B8, chess.H2, color="#cc0000cc"),
        chess.svg.Arrow(chess.C8, chess.H3, color="#cc0000cc"),
        chess.svg.Arrow(chess.D8, chess.H4, color="#cc0000cc"),
        chess.svg.Arrow(chess.E8, chess.H5, color="#cc0000cc"),
        chess.svg.Arrow(chess.F8, chess.H6, color="#cc0000cc"),
        chess.svg.Arrow(chess.G8, chess.H7, color="#cc0000cc"),
    ],
)

open("diagonals-desc.svg", "w").write(svg)


board = chess.Board("8/8/8/8/8/8/8/8 w - - 0 1")

svg = chess.svg.board(
    board,
    size=250,
    coordinates=False,
    # fill=dict.fromkeys(board.attacks(chess.D4), "#ddddddcc"),
    arrows=[
        chess.svg.Arrow(chess.A7, chess.B8, color="#cc0000cc"),
        chess.svg.Arrow(chess.A6, chess.C8, color="#cc0000cc"),
        chess.svg.Arrow(chess.A5, chess.D8, color="#cc0000cc"),
        chess.svg.Arrow(chess.A4, chess.E8, color="#cc0000cc"),
        chess.svg.Arrow(chess.A3, chess.F8, color="#cc0000cc"),
        chess.svg.Arrow(chess.A2, chess.G8, color="#cc0000cc"),
        chess.svg.Arrow(chess.A1, chess.H8, color="#cc0000cc"),
        chess.svg.Arrow(chess.B1, chess.H7, color="#cc0000cc"),
        chess.svg.Arrow(chess.C1, chess.H6, color="#cc0000cc"),
        chess.svg.Arrow(chess.D1, chess.H5, color="#cc0000cc"),
        chess.svg.Arrow(chess.E1, chess.H4, color="#cc0000cc"),
        chess.svg.Arrow(chess.F1, chess.H3, color="#cc0000cc"),
        chess.svg.Arrow(chess.G1, chess.H2, color="#cc0000cc"),
    ],
)

open("diagonals-asc.svg", "w").write(svg)
