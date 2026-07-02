# ==========================================
# Quran Web GPRO
# Database Builder v1.0
# ------------------------------------------
# Input  : chapters.xml
# Output :
#   output/surah.json
#   output/juz.json
#   output/pageMap.json
# ==========================================

import os
import json
import xml.etree.ElementTree as ET

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

INPUT_XML = os.path.join(BASE_DIR, "chapters.xml")

OUTPUT_DIR = os.path.join(BASE_DIR, "output")

os.makedirs(OUTPUT_DIR, exist_ok=True)

print("=======================================")
print(" Quran Web GPRO Database Builder")
print("=======================================")

tree = ET.parse(INPUT_XML)
root = tree.getroot()

# ==========================================
# SURAH
# ==========================================

print("Generating surah.json ...")

surah = []

for index, chapter in enumerate(root.find("suras").find("chapter"), start=1):
    pass

surah = []

for index, chapter in enumerate(root.find("suras").findall("chapter"), start=1):

    surah.append({

        "id": index,

        "name": chapter.attrib["title"],

        "page": int(chapter.attrib["page"]),

        "location": chapter.attrib["loc"]

    })

with open(

    os.path.join(OUTPUT_DIR, "surah.json"),

    "w",

    encoding="utf-8"

) as f:

    json.dump(

        surah,

        f,

        ensure_ascii=False,

        indent=4

    )

print("✔ surah.json")

# ==========================================
# JUZ
# ==========================================

print("Generating juz.json ...")

juz = []

for item in root.find("juzs").findall("juz"):

    juz.append({

        "juz": int(item.attrib["title"]),

        "page": int(item.attrib["page"])

    })

with open(

    os.path.join(OUTPUT_DIR, "juz.json"),

    "w",

    encoding="utf-8"

) as f:

    json.dump(

        juz,

        f,

        ensure_ascii=False,

        indent=4

    )

print("✔ juz.json")

# ==========================================
# PAGEMAP
# ==========================================

print("Generating pageMap.json ...")

pageMap = []

for page in range(1,605):

    pageMap.append({

        "page": page,

        "image": f"{page+3:04}.png"

    })

with open(

    os.path.join(OUTPUT_DIR,"pageMap.json"),

    "w",

    encoding="utf-8"

) as f:

    json.dump(

        pageMap,

        f,

        ensure_ascii=False,

        indent=4

    )

print("✔ pageMap.json")

print()

print("=======================================")
print(" BUILD SUCCESS")
print("=======================================")

print()

print("Output Folder")

print(OUTPUT_DIR)