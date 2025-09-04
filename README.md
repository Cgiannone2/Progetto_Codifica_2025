Istruzioni per la visualizzazione della pagina HTML per l'articolo ```"I carusi in Sicilia", pp. 273-275```

Per visualizzare la pagina risultante, fare clic sul file testX.html.

Comandi per l'utilizzo degli strumenti

1. Trasformazione XSLT con SaxonHE 10.3
Utilizzare il seguente comando per eseguire la trasformazione del file XML tramite XSLT e generare la pagina HTML: java -jar tools/SaxonHE10-3J/saxon-he-10.3.jar -s:progetto/code.xml -xsl:progetto/code.xsl -o:testX.html

2. Validazione XML con Xerces-J
Per effettuare la validazione del file XML utilizzando Xerces-J, eseguire il seguente comando: java -cp tools/Xerces-J-bin.2.12.1/xerces-2_12_1/xml-apis.jar:tools/Xerces-J-bin.2.12.1/xerces-2_12_1/xercesImpl.jar:tools/Xerces-J-bin.2.12.1/xerces-2_12_1/xercesSamples.jar dom.Counter -v progetto/code.xml
