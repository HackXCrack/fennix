fennix
======

El objetivo de este proyecto es el de crear material de la mayor calidad posible de forma colaborativa.

Hoy en día cada foro y comunidad de seguridad crea su propio material, muchas veces ese material no esta completo del todo, es muy básico, y esta mal redactado.
Con el propósito de cambiar esto nació este proyecto, para que cualquier usuario (no solo de HxC foro donde nacio este proyecto) pudiera colaborar y crear contenido de forma distribuida y organizada.

Para los detalles entrar a la [wiki](https://github.com/HackXCrack/fennix/wiki)

Entrar al canal IRC #fennix en freenode (irc.freenode.net) para discutir sobre el proyecto

Estructura de los libros
------------------------
El archivo de clase es fennix.cls, por lo que debe usarse como documento de clase. El documento debe tener la estructura siguiente:

```TeX
\documentclass{fennix}

\begin{document}

\title{Título del documento}
\author{Autor del documento}
\date{}
\maketitle
\begin{resumen}
Aquí debe ir un resumen del documento
\end{resumen}

\begin{requisitos}
\begin{itemize}
\item Aquí deben ir los requisitos necesarios para entender el documento
\end{itemize}
\end{requisitos}

Aquí el cuerpo del documento

\begin{colabs}
Aquí los colaboradores con un enlace de contacto, tal cual se encuentra en la plantilla:

Colaborador 1: email1

...
\end{colabs}

\end{document}
```
El entorno "requisitos" ya incluye el índice, no hace falta incluir un \tableofcontents.

En el archivo plantilla/plantilla.tex se encuentra lo anterior para poder empezar a escribir.

El archivo ejemplo/prueba.tex es el cuaderno original de piou sobre punteros reescrito en parte mediante latex. Contiene tablas, trozos de código, secciones, subsecciones, etc. por lo que puede servir como referencia para algunas cosas básicas. La versión compilada es ejemplo/prueba.pdf.

Compilacion de un libro
-----------------------
Para compilar el documento (obligatorio usar XeLaTeX, no LaTeX ni pdfLaTeX):

 ``xelatex archivo.tex``

Creará el archivo archivo.pdf
