import os
from reportlab.lib.pagesizes import letter
from reportlab.lib import colors
from reportlab.pdfgen import canvas

# Función para obtener la lista de archivos .swift en el directorio actual
def obtener_archivos_swift():
    archivos_swift = []
    for archivo in os.listdir():
        if archivo.endswith(".swift"):
            archivos_swift.append(archivo)
    return archivos_swift

# Función para leer el contenido de un archivo .swift
def leer_archivo(archivo):
    with open(archivo, 'r', encoding="utf-8") as f:
        return f.read()

# Función para generar el PDF con el contenido de los archivos .swift
def generar_pdf(archivos):
    c = canvas.Canvas("codigo_swift.pdf", pagesize=letter)
    y = 750
    for archivo in archivos:
        contenido = leer_archivo(archivo)
        lines = contenido.split('\n')
        
        # Agregar título de la página con el nombre del archivo
        c.setFont("Helvetica-Bold", 14)
        c.drawString(50, y, archivo)
        y -= 20  # Espacio entre el título y el contenido
        
        # Agregar líneas de contenido con colores y estilos
        c.setFont("Helvetica", 12)
        for line in lines:
            if line.strip():  # Saltar líneas vacías
                c.setFillColor(colors.blue)  # Color de la fuente
                c.drawString(50, y, line)
                y -= 12  # Espacio entre líneas
        
        c.showPage()  # Nueva página
        y = 750  # Reiniciar posición para el próximo archivo
    
    c.save()

# Obtener la lista de archivos .swift en el directorio actual
archivos_swift = obtener_archivos_swift()

# Generar el PDF con el contenido de los archivos .swift
generar_pdf(archivos_swift)

print("PDF generado correctamente.")
