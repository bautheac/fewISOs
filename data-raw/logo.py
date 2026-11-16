# Generate the hex sticker (man/figures/logo.svg|png) and pkgdown favicons.
# Set ALLER_RG to the font path. Needs cairosvg, fonttools and pillow (not package dependencies; install ad hoc).
# Layout mirrors abnoRmal: name on top, line-art mark below, darker hex border.
import math, os, re
import cairosvg
from fontTools.ttLib import TTFont
from fontTools.pens.svgPathPen import SVGPathPen
from fontTools.pens.transformPen import TransformPen
from PIL import Image

# Aller_Rg, the font hexSticker uses (and abnoRmal's logo): hexSticker/inst/fonts/Aller/Aller_Rg.ttf.
# Dalton Maag free licence, see Aller_Font_License.txt next to it.
FONT = os.environ["ALLER_RG"]
FILL, BORDER, CREAM, CORAL = "#0E4D5C", "#093440", "#F6F1E7", "#FF7A59"
W, H = 240, 277.13
ft = TTFont(FONT); gs = ft.getGlyphSet(); cmap = ft.getBestCmap(); upm = ft["head"].unitsPerEm

def hexpts(cx, cy, r):
    return " ".join(f"{cx + r*math.cos(math.radians(-90+60*i)):.2f},{cy + r*math.sin(math.radians(-90+60*i)):.2f}" for i in range(6))

def text(s, size, cx, base, fill):
    sc = size / upm
    adv = [(0.34 * size if c == "I" else gs[cmap[ord(c)]].width * sc) for c in s]
    x = cx - sum(adv) / 2; d = ""
    for c, a in zip(s, adv):
        if c == "I":  # slab-serif I so it cannot be read as a lowercase l
            w, st, se, ch = 0.30 * size, 0.09 * size, 0.045 * size, 0.723 * size; x0 = x + (a - w) / 2; k = (w - st) / 2
            d += f"M{x0:.2f},{base-ch:.2f}h{w:.2f}v{se:.2f}h{-k:.2f}v{ch-2*se:.2f}h{k:.2f}v{se:.2f}h{-w:.2f}v{-se:.2f}h{k:.2f}v{-(ch-2*se):.2f}h{-k:.2f}Z"
        else:
            p = SVGPathPen(gs); gs[cmap[ord(c)]].draw(TransformPen(p, (sc, 0, 0, -sc, x, base))); d += p.getCommands()
        x += a
    return f'<path fill="{fill}" d="{d}"/>'

def sector(cx, cy, R, sw, a0, a1):
    P = lambda a, r: (cx + r*math.cos(math.radians(a)), cy + r*math.sin(math.radians(a)))
    ro, ri = R + sw/2, R - sw/2; o0, o1, i1, i0 = P(a0, ro), P(a1, ro), P(a1, ri), P(a0, ri)
    return (f'<path fill="{CREAM}" d="M{o0[0]:.2f},{o0[1]:.2f}A{ro},{ro} 0 0 1 {o1[0]:.2f},{o1[1]:.2f}'
            f'L{i1[0]:.2f},{i1[1]:.2f}A{ri},{ri} 0 0 0 {i0[0]:.2f},{i0[1]:.2f}Z"/>')

def mark(cx, cy, R, sw, gap, s):
    b = "".join(sector(cx, cy, R, sw, -90 + gap/2 + 120*i, 30 - gap/2 + 120*i) for i in range(3))
    b += f'<rect x="{cx-5*s:.2f}" y="{cy-6*s:.2f}" width="{10*s:.2f}" height="{34*s:.2f}" fill="{CREAM}"/>'
    b += f'<polygon points="{hexpts(cx, cy-24*s, 10*s)}" fill="{CORAL}"/>'
    return b

def frame(inner, bw):
    return (f'<polygon points="{hexpts(120,138.56,138.56)}" fill="{BORDER}"/>'
            f'<polygon points="{hexpts(120,138.56,138.56-bw*1.1547)}" fill="{FILL}"/>' + inner)

def svg(body, vb=f"0 0 {W} {H:.2f}"):
    return f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="{vb}">{body}</svg>'

logo = svg(frame(text("fewISOs", 30.5, 120, 100.5, "#FFFFFF") + mark(120, 176, 46, 10, 30, 1.0), 7))
icon = svg(frame(mark(120, 138.56, 66, 17, 30, 1.45), 7))
tile = lambda r: (f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256"><rect width="256" height="256" rx="{r}" fill="{FILL}"/>'
                  f'<g transform="translate(128 128) scale(0.92) translate(-120 -138.56)">{mark(120,138.56,66,17,30,1.45)}</g></svg>')
os.makedirs("man/figures", exist_ok=True); os.makedirs("pkgdown/favicon", exist_ok=True)
open("man/figures/logo.svg", "w").write(logo)
cairosvg.svg2png(bytestring=logo.encode(), write_to="man/figures/logo.png", output_width=553)
fav = "pkgdown/favicon/"
open(fav + "favicon.svg", "w").write(icon)
cairosvg.svg2png(bytestring=icon.encode(), write_to=fav + "favicon-96x96.png", output_width=96)
cairosvg.svg2png(bytestring=tile(0).encode(), write_to=fav + "apple-touch-icon.png", output_width=180)
cairosvg.svg2png(bytestring=tile(0).encode(), write_to=fav + "web-app-manifest-192x192.png", output_width=192)
cairosvg.svg2png(bytestring=tile(0).encode(), write_to=fav + "web-app-manifest-512x512.png", output_width=512)
cairosvg.svg2png(bytestring=icon.encode(), write_to="/tmp/_fav.png", output_width=256)
Image.open("/tmp/_fav.png").save(fav + "favicon.ico", sizes=[(16,16),(32,32),(48,48)])
