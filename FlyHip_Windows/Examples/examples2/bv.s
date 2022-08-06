        .data
        .org      0x40000000
A:      .byte       0x01

        .text
        .org      0
        lhi         r1, 0x000123403
        addui       r1, r1, A ; naloadamo A u r1
        lb          r2, 0(r1) ; naloadamo A* v r2 (predznaceno)
        lbu         r3, 0(r1) ; naloadamo A* v r3 (nepredznaceno)
