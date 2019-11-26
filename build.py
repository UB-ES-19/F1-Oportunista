import argparse
import os
import sass
import shutil

CSS_PATH = os.path.join('idealista', 'static', 'css')
CSS_FILE = os.path.join(CSS_PATH, 'style.css')
SCSS_PATH = os.path.join('scss')

BOOTSTRAP_JS = 'node_modules/bootstrap/dist/js/bootstrap.js'
JS_PATH = 'idealista/static/js'


parser = argparse.ArgumentParser()
parser.add_argument(
    '-m', '--minify',
    help='minifies css',
    action='store_true')
parser.add_argument(
    "--no-css",
    help="disables building of css",
    action="store_true")
parser.add_argument(
    "--no-js",
    help="disables building of js",
    action="store_true")

args = parser.parse_args()


def build_css(file='style.scss'):
    print('Building css...', end='')
    sass.compile(dirname=(SCSS_PATH, CSS_PATH), output_style='compressed')
    print('DONE')


def build_js(input_folder=CSS_PATH):
    print('Building js...', end='')
    shutil.copy(BOOTSTRAP_JS, JS_PATH)
    print('DONE')


if not args.no_css:
    build_css()

if not args.no_js:
    build_js()
