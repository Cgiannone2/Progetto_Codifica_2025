<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns="http://www.w3.org/1999/xhtml">

  <xsl:output method="html" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Edizione Digitale: I Carusi in Sicilia</title>
        <link href="progetto/code.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
        <script type="text/javascript" src="progetto/code.js"></script>
      </head>
      <body>
        <header>
          <nav class="navMenu">
            <a href="#intro">Introduzione</a>
            <a href="#art1_carusi">I Carusi in Sicilia</a>
            <a href="#art2_commercio">Il Commercio nel Trimestre</a>
            <a href="#sezione_bibliografia">Bibliografia</a>
            <a href="#sezione_notizie">Notizie</a>
          </nav>
        </header>

        <div class="section-block" id="intro">
          <h2>Introduzione al Progetto</h2>
          <div class="indent">
            <p>
              <strong>Titolo Edizione Digitale:</strong>
              <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
            </p>
            <p>
              <strong>Autore Edizione Digitale:</strong>
              <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/>
            </p>
            <p>
              <strong>Progetto sviluppato sotto la guida del Prof.:</strong>
              <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:respStmt[1]/tei:name"/>
            </p>
            <p>
              <strong>Data Edizione:</strong>
              <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:edition/tei:date/@when"/>
            </p>
            <p>
              <strong>Luogo Pubblicazione Originale:</strong>
              <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:pubPlace/tei:placeName"/>
            </p>
            <p>
              <strong>Data Originale:</strong>
              <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date/@when"/>
            </p>
          </div>
        </div>

        <xsl:apply-templates select="tei:TEI/tei:text/tei:body/tei:div[@xml:id='articolo_carusi_sicilia']"/>

        <div class="section-block" id="art2_commercio">
          <h2>Articolo 2: Il commercio nel primo trimestre 1881</h2>
          <div class="indent">
          </div>
        </div>

        <div class="section-block" id="sezione_bibliografia">
          <h2>Sezione Bibliografia</h2>
          <div class="indent">
          </div>
        </div>

        <div class="section-block" id="sezione_notizie">
          <h2>Sezione Notizie</h2>
          <div class="indent">
          </div>
        </div>

        <footer>
          <p style="text-align: center; margin-top: 50px; color: #aaa;">Edizione digitale creata per il corso di Codifica di Testi - Università di Pisa</p>
        </footer>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="tei:div[@xml:id='articolo_carusi_sicilia']">
    <div id="art1_carusi" class="section-block">
      <h2>Articolo: I "Carusi" in Sicilia</h2>
      <div class="boxTrascrizione">

        <div class="controls-grid">
          <div class='box-legenda'>
            <h3 id="legenda_title">LEGENDA</h3>
            <p>
              <span class="persName-legend">Persone Reali</span>
            </p>
            <p>
              <span class="orgName-legend">Organizzazioni / Case Editrici / Riviste</span>
            </p>
            <p>
              <span class="placeName-legend">Luoghi</span>
            </p>
            <p>
              <span class="term-legend">Termini / Verbum</span>
            </p>
            <p>
              <span class="date-legend">Date</span>
            </p>
            <p>
              <span class="foreign-legend">Testo in Lingua Straniera</span>
            </p>
            <p>
              <span class="quote-legend">Citazioni</span>
            </p>
          </div>

          <div class="box-btn">
            <h3 class="bntTitoloLeg">VISUALIZZA / NASCONDI FENOMENI</h3>
            <p class="rowBtn">
              <button type="button" class="btnPersName" onclick="togglePhenomenon('persName')">Persone</button>
              <button type="button" class="btnOrgName" onclick="togglePhenomenon('orgName')">Organizzazioni/caseEd/Riviste</button>
            </p>
            <p class="rowBtn">
              <button type="button" class="btnPlaceName" onclick="togglePhenomenon('placeName')">Luoghi</button>
              <button type="button" class="btnTerm" onclick="togglePhenomenon('term')">Termini/Verbum</button>
            </p>
            <p class="rowBtn">
              <button type="button" class="btnDate" onclick="togglePhenomenon('date')">Date</button>
              <button type="button" class="btnForeign" onclick="togglePhenomenon('foreign')">Straniere</button>
            </p>
            <p class="rowBtn">
              <button type="button" class="btnQuote" onclick="togglePhenomenon('quote')">Citazioni</button>
            </p>
          </div>
        </div>

        <button class="carousel-prev" onclick="changeSlide(-1)">&#10094;</button>

        <div class="carousel-container">
          <div class="img-wrapper">
            <div id="image-carousel-content">
              <div class="carousel-slide active">
                <div class="svg-container">
                  <img src="{//tei:graphic[@xml:id='pag273']/@url}" alt="Pagina 1" class="base-image" />
                  <svg id="svg-overlay"
                    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1006 1450" preserveAspectRatio="xMidYMid meet">
                    <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone">
                      <rect id="zone-{@xml:id}" x="{@ulx}" y="{@uly}" width="{number(@lrx) - number(@ulx)}" height="{number(@lry) - number(@uly)}" class="highlight-zone" onmouseover="gestoreEvidenziaSVG('zone-{@xml:id}')" onmouseout="gestoreDisEvidenziaSVG('zone-{@xml:id}')" />
                    </xsl:for-each>
                  </svg>
                </div>
              </div>
              <div class="carousel-slide">
                <h1 style="color:white;">Ciao 1</h1>
              </div>
            </div>
          </div>

          <div class="transcription-area">
            <div id="text-carousel-content">
              <div class="carousel-slide-text active">
                <xsl:apply-templates select="tei:head[@rend='pageHeader']"/>
                <div class="flex" id="p273_subTitle">
                  <xsl:apply-templates select="tei:head[@type='subtitle']"/>
                </div>
                <div class="date_container">
                  <div class="flex" id="p273_vol">
                    <xsl:apply-templates select="tei:head[@type='vol']"/>
                  </div>
                  <div class="flex" id="p273_date">
                    <xsl:apply-templates select="tei:div[@xml:id='p273_date']"/>
                  </div>
                  <div class="flex" id="p273_number">
                    <xsl:apply-templates select="tei:num"/>
                  </div>
                </div>
                <div class="trascrizione">
                  <div class="col">
                    <xsl:apply-templates select="tei:div[@xml:id='p273_par1_col_1']"/>
                  </div>
                  <div class="col">
                    <xsl:apply-templates select="tei:div[@xml:id='p273_par1_col_2']"/>
                  </div>
                </div>
              </div>
              <div class="carousel-slide-text">
                <h1 style="color:white;">Ciao 2</h1>
              </div>
            </div>
          </div>
        </div>

        <button class="carousel-next" onclick="changeSlide(1)">&#10095;</button>
      </div>
    </div>
  </xsl:template>


  <xsl:template match="tei:div[@xml:id='p273_par1_col_1']">
    <div class="flex">
      <span class="article-title" id="p273_articleTitle">
        <xsl:apply-templates select="tei:span"/>
      </span>
    </div>
    <xsl:for-each select="tei:p">
      <p id="{@xml:id}">
        <xsl:apply-templates/>
      </p>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="tei:div[@xml:id='p273_par1_col_2']">
    <div class="flex">
      <span class="article-title" id="p273_articleTitle">
        <xsl:apply-templates select="tei:span"/>
      </span>
    </div>
    <xsl:for-each select="tei:p">
      <p id="{@xml:id}">
        <xsl:apply-templates/>
      </p>
    </xsl:for-each>
  </xsl:template>


  <xsl:template match="tei:persName">
    <span class="persName">
      <xsl:attribute name="data-ref">
        <xsl:value-of select="@ref"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:orgName">
    <span class="orgName">
      <xsl:attribute name="id">
        <xsl:value-of select="@xml:id"/>
      </xsl:attribute>
      <xsl:attribute name="data-ref">
        <xsl:value-of select="@ref"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:placeName">
    <span class="placeName">
      <xsl:attribute name="data-ref">
        <xsl:value-of select="@ref"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:term">
    <span class="term">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:date">
    <span class="date">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

</xsl:stylesheet>