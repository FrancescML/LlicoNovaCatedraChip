import chess
import chess.svg
import chess.variant

board = chess.Board("2Q5/5Q2/3Q4/1Q6/7Q/4Q3/6Q1/Q7 w - - 0 1")

svg = chess.svg.board(
    board,
    size=250,
    coordinates=False,
)

open("8reines.svg", "w").write(svg)


board = chess.Board("8/8/8/8/3Q4/8/8/8 w - - 0 1")

svg = chess.svg.board(
    board,
    size=250,
    coordinates=False,
    # fill=dict.fromkeys(board.attacks(chess.D4), "#ddddddcc"),
    arrows=[
        chess.svg.Arrow(chess.E5, chess.H8, color="#cc0000cc"),
        chess.svg.Arrow(chess.C3, chess.A1, color="#cc0000cc"),
        chess.svg.Arrow(chess.E3, chess.G1, color="#cc0000cc"),
        chess.svg.Arrow(chess.C5, chess.A7, color="#cc0000cc"),
        chess.svg.Arrow(chess.D5, chess.D8, color="#cc0000cc"),
        chess.svg.Arrow(chess.D3, chess.D1, color="#cc0000cc"),
        chess.svg.Arrow(chess.C4, chess.A4, color="#cc0000cc"),
        chess.svg.Arrow(chess.E4, chess.H4, color="#cc0000cc"),
    ],
)

open("amenaces.svg", "w").write(svg)


svg = chess.svg.piece(chess.Piece.from_symbol("q"))
open("reines.svg", "w").write(svg)
