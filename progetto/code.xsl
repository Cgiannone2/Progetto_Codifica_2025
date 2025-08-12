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

        <xsl:apply-templates select="tei:TEI/tei:text/tei:body/tei:div[@xml:id='il_commercio']"/>

     <div class="section-block" id="sezione_bibliografia">
          <h2>Sezione Bibliografia</h2>
          <div class="indent">
            <xsl:apply-templates select="//tei:listBibl/tei:bibl[@xml:id='bibl_giuseppe_colombo']"/>
            <xsl:apply-templates select="//tei:listBibl/tei:bibl[@xml:id='bibl_guido_padeletti']"/>
          </div>
        </div>

       <div class="section-block" id="sezione_notizie">
          <h2>Sezione Notizie</h2>
          <div class="indent">
            <xsl:apply-templates select="//tei:listBibl/tei:bibl[@xml:id='notizie_gustavo_dugaut']"/>
            <xsl:apply-templates select="//tei:listBibl/tei:bibl[@xml:id='notizie_errata_corrige']"/>
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
              <span class="persone-reali-legend">Persone reali</span>
            </p>
            <p>
              <span class="persone-immaginarie-legend">Persone immaginarie e/o personaggi</span>
            </p>
            <p>
              <span class="opere-legend">Opere</span>
            </p>
            <p>
              <span class="luoghi-geografici-legend">Luoghi geografici</span>
            </p>
            <p>
              <span class="luoghi-naturali-legend">Luoghi naturali</span>
            </p>
            <p>
              <span class="casa-editrice-rivista-legend">Casa editrice/rivista</span>
            </p>
            <p>
              <span class="date-legend">Date</span>
            </p>
            <p>
              <span class="verbum-legend">Verbum</span>
            </p>
            <p>
              <span class="temi-motivi-legend">Temi e/o motivi</span>
            </p>
            <p>
              <span class="correnti-letterarie-legend">Correnti letterarie</span>
            </p>
            <p>
              <span class="lingua-straniera-legend">Testo in lingua straniera</span>
            </p>
            <p>
              <span class="citazioni-legend">Citazioni</span>
            </p>
            <p>
              <span class="organizzazioni-legend">Organizzazioni</span>
            </p>
            <p>
              <span class="epithet-legend">Epithet</span>
            </p>
          </div>
          <div class="box-btn">
            <h3 class="bntTitoloLeg">VISUALIZZA / NASCONDI FENOMENI</h3>
            <p class="rowBtn">
              <button type="button" class="btnPersoneReali" onclick="togglePhenomenon('persone-reali', 'art1_carusi')">Persone reali</button>
              <button type="button" class="btnPersoneImmaginarie" onclick="togglePhenomenon('persone-immaginarie', 'art1_carusi')">Personaggi</button>
            </p>
            <p class="rowBtn">
              <button type="button" class="btnOpere" onclick="togglePhenomenon('opere', 'art1_carusi')">Opere</button>
              <button type="button" class="btnLuoghiGeografici" onclick="togglePhenomenon('luoghi-geografici', 'art1_carusi')">Luoghi geografici</button>
            </p>
            <p class="rowBtn">
              <button type="button" class="btnLuoghiNaturali" onclick="togglePhenomenon('luoghi-naturali', 'art1_carusi')">Luoghi naturali</button>
              <button type="button" class="btnCasaEditriceRivista" onclick="togglePhenomenon('casa-editrice-rivista', 'art1_carusi')">Casa editrice/rivista</button>
            </p>
            <p class="rowBtn">
              <button type="button" class="btnDate" onclick="togglePhenomenon('date', 'art1_carusi')">Date</button>
              <button type="button" class="btnVerbum" onclick="togglePhenomenon('verbum', 'art1_carusi')">Verbum</button>
            </p>
            <p class="rowBtn">
              <button type="button" class="btnTemiMotivi" onclick="togglePhenomenon('temi-motivi', 'art1_carusi')">Temi e/o motivi</button>
              <button type="button" class="btnCorrentiLetterarie" onclick="togglePhenomenon('correnti-letterarie', 'art1_carusi')">Correnti letterarie</button>
            </p>
            <p class="rowBtn">
              <button type="button" class="btnLinguaStraniera" onclick="togglePhenomenon('lingua-straniera', 'art1_carusi')">Testo in lingua straniera</button>
              <button type="button" class="btnCitazioni" onclick="togglePhenomenon('citazioni', 'art1_carusi')">Citazioni</button>
            </p>
            <p class="rowBtn">
              <button type="button" class="btnOrganizzazioni" onclick="togglePhenomenon('organizzazioni', 'art1_carusi')">Organizzazioni</button>
              <button type="button" class="btnEpithet" onclick="togglePhenomenon('epithet', 'art1_carusi')">Epithet</button>
            </p>
          </div>
        </div>

        <button class="carousel-prev" onclick="changeSlide1(-1)">&#10094;</button>

        <div class="carousel-container">
          <div class="img-wrapper">
            <div id="image-carousel-content">
              <xsl:for-each select="//tei:facsimile/tei:surface[contains(@n, '273') or contains(@n, '274') or contains(@n, '275')]">
                <div class="carousel-slide">
                  <div class="svg-container">
                    <img src="{tei:graphic/@url}" class="base-image" />
                    <xsl:choose>
                      <xsl:when test="@n = '273'">
                        <svg id="svg-overlay"
                          xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1006 1450" preserveAspectRatio="xMidYMid meet">
                          <xsl:for-each select="tei:zone">
                            <rect id="zone-{@xml:id}" x="{@ulx}" y="{@uly}" width="{number(@lrx) - number(@ulx)}" height="{number(@lry) - number(@uly)}" class="highlight-zone" onmouseover="gestoreEvidenziaSVG('zone-{@xml:id}')" onmouseout="gestoreDisEvidenziaSVG('zone-{@xml:id}')" />
                          </xsl:for-each>
                        </svg>
                      </xsl:when>
                      <xsl:when test="@n = '274'">
                        <svg id="svg-overlay"
                          xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1186 1744" preserveAspectRatio="xMidYMid meet">
                          <xsl:for-each select="tei:zone">
                            <rect id="zone-{@xml:id}" x="{@ulx}" y="{@uly}" width="{number(@lrx) - number(@ulx)}" height="{number(@lry) - number(@uly)}" class="highlight-zone" onmouseover="gestoreEvidenziaSVG('zone-{@xml:id}')" onmouseout="gestoreDisEvidenziaSVG('zone-{@xml:id}')" />
                          </xsl:for-each>
                        </svg>
                      </xsl:when>
                      <xsl:when test="@n = '275'">
                        <svg id="svg-overlay"
                          xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1186 1744" preserveAspectRatio="xMidYMid meet">
                          <xsl:for-each select="tei:zone">
                            <rect id="zone-{@xml:id}" x="{@ulx}" y="{@uly}" width="{number(@lrx) - number(@ulx)}" height="{number(@lry) - number(@uly)}" class="highlight-zone" onmouseover="gestoreEvidenziaSVG('zone-{@xml:id}')" onmouseout="gestoreDisEvidenziaSVG('zone-{@xml:id}')" />
                          </xsl:for-each>
                        </svg>
                      </xsl:when>
                    </xsl:choose>
                  </div>
                </div>
              </xsl:for-each>
            </div>
          </div>
          <div class="transcription-area">
            <div id="text-carousel-content">
              <xsl:for-each select="//tei:facsimile/tei:surface[contains(@n, '273') or contains(@n, '274') or contains(@n, '275')]">
                <div class="carousel-slide-text">
                  <xsl:choose>
                    <xsl:when test="@n = '273'">
                      <xsl:apply-templates select="//tei:text/tei:body/tei:div[@type='article']/tei:head[@rend='pageHeader']"/>
                      <div class="flex" id="p273_subTitle">
                        <xsl:apply-templates select="//tei:text/tei:body/tei:div[@type='article']/tei:head[@type='subtitle']"/>
                      </div>
                      <div class="date_container">
                        <div class="flex" id="p273_vol">
                          <xsl:apply-templates select="//tei:text/tei:body/tei:div[@type='article']/tei:head[@type='vol']"/>
                        </div>
                        <div class="flex" id="p273_date">
                          <xsl:apply-templates select="//tei:text/tei:body/tei:div[@type='article']/tei:div[@xml:id='p273_date']"/>
                        </div>
                        <div class="flex" id="p273_number">
                          <xsl:apply-templates select="//tei:text/tei:body/tei:div[@type='article']/tei:num"/>
                        </div>
                      </div>
                      <div class="trascrizione">
                        <div class="col">
                          <xsl:apply-templates select="//tei:text/tei:body/tei:div[@type='article']/tei:div[@xml:id='p273_par1_col_1']"/>
                        </div>
                        <div class="col">
                          <xsl:apply-templates select="//tei:text/tei:body/tei:div[@type='article']/tei:div[@xml:id='p273_par1_col_2']"/>
                        </div>
                      </div>
                    </xsl:when>
                    <xsl:when test="@n = '274'">
                      <xsl:apply-templates select="//tei:text/tei:body/tei:div[@xml:id='articolo_carusi_sicilia']/tei:div[@xml:id='p274_container']/tei:div[@xml:id='pageHeader_274']"/>
                      <div class="trascrizione">
                        <div class="col">
                          <xsl:apply-templates select="//tei:text/tei:body/tei:div[@xml:id='articolo_carusi_sicilia']/tei:div[@xml:id='p274_container']/tei:div[@xml:id='p274_col_1']"/>
                        </div>
                        <div class="col">
                          <xsl:apply-templates select="//tei:text/tei:body/tei:div[@xml:id='articolo_carusi_sicilia']/tei:div[@xml:id='p274_container']/tei:div[@xml:id='p274_col_2']"/>
                        </div>
                      </div>
                    </xsl:when>
                    <xsl:when test="@n = '275'">
                      <xsl:apply-templates select="//tei:text/tei:body/tei:div[@xml:id='articolo_carusi_sicilia']/tei:div[@xml:id='p275_container']/tei:div[@xml:id='pageHeader_275']"/>
                      <div class="trascrizione">
                        <div class="col">
                          <xsl:apply-templates select="//tei:text/tei:body/tei:div[@xml:id='articolo_carusi_sicilia']/tei:div[@xml:id='p275_container']/tei:div[@xml:id='p275_col_1']"/>
                        </div>
                      </div>
                    </xsl:when>
                  </xsl:choose>
                </div>
              </xsl:for-each>
            </div>
          </div>
        </div>
        <button class="carousel-next" onclick="changeSlide1(1)">&#10095;</button>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="tei:div[@xml:id='il_commercio']">
    <div id="art2_commercio" class="section-block">
      <h2>Articolo 2: Il commercio nel primo trimestre 1881</h2>
      <div class="boxTrascrizione">
        <div class="controls-grid">
          <div class='box-legenda'>
            <h3 id="legenda_title">LEGENDA</h3>
            <p>
              <span class="persone-reali-legend">Persone reali</span>
            </p>
            <p>
              <span class="persone-immaginarie-legend">Persone immaginarie e/o personaggi</span>
            </p>
            <p>
              <span class="opere-legend">Opere</span>
            </p>
            <p>
              <span class="luoghi-geografici-legend">Luoghi geografici</span>
            </p>
            <p>
              <span class="luoghi-naturali-legend">Luoghi naturali</span>
            </p>
            <p>
              <span class="casa-editrice-rivista-legend">Casa editrice/rivista</span>
            </p>
            <p>
              <span class="date-legend">Date</span>
            </p>
            <p>
              <span class="verbum-legend">Verbum</span>
            </p>
            <p>
              <span class="temi-motivi-legend">Temi e/o motivi</span>
            </p>
            <p>
              <span class="correnti-letterarie-legend">Correnti letterarie</span>
            </p>
            <p>
              <span class="lingua-straniera-legend">Testo in lingua straniera</span>
            </p>
            <p>
              <span class="citazioni-legend">Citazioni</span>
            </p>
            <p>
              <span class="organizzazioni-legend">Organizzazioni</span>
            </p>
            <p>
              <span class="epithet-legend">Epithet</span>
            </p>
          </div>
          <div class="box-btn">
            <h3 class="bntTitoloLeg">VISUALIZZA / NASCONDI FENOMENI</h3>
            <p class="rowBtn">
              <button type="button" class="btnPersoneReali" onclick="togglePhenomenon('persone-reali', 'art2_commercio')">Persone reali</button>
              <button type="button" class="btnPersoneImmaginarie" onclick="togglePhenomenon('persone-immaginarie', 'art2_commercio')">Personaggi</button>
            </p>
            <p class="rowBtn">
              <button type="button" class="btnOpere" onclick="togglePhenomenon('opere', 'art2_commercio')">Opere</button>
              <button type="button" class="btnLuoghiGeografici" onclick="togglePhenomenon('luoghi-geografici', 'art2_commercio')">Luoghi geografici</button>
            </p>
            <p class="rowBtn">
              <button type="button" class="btnLuoghiNaturali" onclick="togglePhenomenon('luoghi-naturali', 'art2_commercio')">Luoghi naturali</button>
              <button type="button" class="btnCasaEditriceRivista" onclick="togglePhenomenon('casa-editrice-rivista', 'art2_commercio')">Casa editrice/rivista</button>
            </p>
            <p class="rowBtn">
              <button type="button" class="btnDate" onclick="togglePhenomenon('date', 'art2_commercio')">Date</button>
              <button type="button" class="btnVerbum" onclick="togglePhenomenon('verbum', 'art2_commercio')">Verbum</button>
            </p>
            <p class="rowBtn">
              <button type="button" class="btnTemiMotivi" onclick="togglePhenomenon('temi-motivi', 'art2_commercio')">Temi e/o motivi</button>
              <button type="button" class="btnCorrentiLetterarie" onclick="togglePhenomenon('correnti-letterarie', 'art2_commercio')">Correnti letterarie</button>
            </p>
            <p class="rowBtn">
              <button type="button" class="btnLinguaStraniera" onclick="togglePhenomenon('lingua-straniera', 'art2_commercio')">Testo in lingua straniera</button>
              <button type="button" class="btnCitazioni" onclick="togglePhenomenon('citazioni', 'art2_commercio')">Citazioni</button>
            </p>
            <p class="rowBtn">
              <button type="button" class="btnOrganizzazioni" onclick="togglePhenomenon('organizzazioni', 'art2_commercio')">Organizzazioni</button>
              <button type="button" class="btnEpithet" onclick="togglePhenomenon('epithet', 'art2_commercio')">Epithet</button>
            </p>
          </div>
        </div>
        <button class="carousel-prev" onclick="changeSlide2(-1)">&#10094;</button>
        <div class="carousel-container">
          <div class="img-wrapper">
            <div id="image-carousel-content-2">
              <xsl:for-each select="//tei:facsimile/tei:surface[contains(@n, '275') or contains(@n, '276')]">
                <div class="carousel-slide">
                  <div class="svg-container">
                    <img src="{tei:graphic/@url}" class="base-image" />
                    <xsl:choose>
                      <xsl:when test="@n = '275'">
                        <svg id="svg-overlay"
                          xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1094 1636" preserveAspectRatio="xMidYMid meet">
                          <xsl:for-each select="tei:zone">
                            <rect id="zone-{@xml:id}" x="{@ulx}" y="{@uly}" width="{number(@lrx) - number(@ulx)}" height="{number(@lry) - number(@uly)}" class="highlight-zone" onmouseover="gestoreEvidenziaSVG('zone-{@xml:id}')" onmouseout="gestoreDisEvidenziaSVG('zone-{@xml:id}')" />
                          </xsl:for-each>
                        </svg>
                      </xsl:when>
                      <xsl:when test="@n = '276'">
                        <svg id="svg-overlay"
                          xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1078 1624" preserveAspectRatio="xMidYMid meet">
                          <xsl:for-each select="tei:zone">
                            <rect id="zone-{@xml:id}" x="{@ulx}" y="{@uly}" width="{number(@lrx) - number(@ulx)}" height="{number(@lry) - number(@uly)}" class="highlight-zone" onmouseover="gestoreEvidenziaSVG('zone-{@xml:id}')" onmouseout="gestoreDisEvidenziaSVG('zone-{@xml:id}')" />
                          </xsl:for-each>
                        </svg>
                      </xsl:when>
                    </xsl:choose>
                  </div>
                </div>
              </xsl:for-each>
            </div>
          </div>
          <div class="transcription-area">
            <div id="text-carousel-content-2">
              <xsl:for-each select="//tei:facsimile/tei:surface[contains(@n, '275') or contains(@n, '276')]">
                <div class="carousel-slide-text">
                  <xsl:if test="position() = 1">
                    <xsl:attribute name="class">carousel-slide-text active</xsl:attribute>
                  </xsl:if>
                  <xsl:choose>
                    <xsl:when test="@n = '275'">
                      <xsl:apply-templates select="//tei:text/tei:body/tei:div[@xml:id='il_commercio']/tei:div[@xml:id='pageHeader_275_com']"/>
                      <div class="trascrizione">
                        <div class="col">
                          <xsl:apply-templates select="//tei:text/tei:body/tei:div[@xml:id='il_commercio']/tei:div[@xml:id='p275_col_1_com']"/>
                        </div>
                        <div class="col">
                          <xsl:apply-templates select="//tei:text/tei:body/tei:div[@xml:id='il_commercio']/tei:div[@xml:id='p275_col_2_com']"/>
                        </div>
                      </div>
                    </xsl:when>
                    <xsl:when test="@n = '276'">
                      <xsl:apply-templates select="//tei:text/tei:body/tei:div[@xml:id='il_commercio']/tei:div[@xml:id='p276_container']/tei:div[@xml:id='pageHeader_276']"/>
                      <div class="trascrizione">
                        <div class="col">
                          <xsl:apply-templates select="//tei:text/tei:body/tei:div[@xml:id='il_commercio']/tei:div[@xml:id='p276_container']/tei:div[@xml:id='p276_col_1']"/>
                        </div>
                      </div>
                    </xsl:when>
                  </xsl:choose>
                </div>
              </xsl:for-each>
            </div>
          </div>
        </div>
        <button class="carousel-next" onclick="changeSlide2(1)">&#10095;</button>
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

  <xsl:template match="tei:div[@xml:id='p274_col_1']">
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

  <xsl:template match="tei:div[@xml:id='p274_col_2']">
    <xsl:for-each select="tei:p">
      <p id="{@xml:id}">
        <xsl:apply-templates/>
      </p>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="tei:div[@xml:id='p275_col_1']">
    <xsl:for-each select="tei:p">
      <p id="{@xml:id}">
        <xsl:apply-templates/>
      </p>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="tei:div[@xml:id='p276_col_1']">
    <xsl:for-each select="tei:p">
      <p id="{@xml:id}">
        <xsl:apply-templates/>
      </p>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="tei:div[@xml:id='p275_col_1_com']">
    <xsl:for-each select="tei:p">
      <p id="{@xml:id}">
        <xsl:apply-templates/>
      </p>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="tei:div[@xml:id='p275_col_2_com']">
    <xsl:for-each select="tei:p">
      <p id="{@xml:id}">
        <xsl:apply-templates/>
      </p>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="tei:div[@xml:id='pageHeader_274']">
    <div class="flex-full">
      <p class="page-number" id="p274_number">
        <xsl:value-of select="tei:num"/>
      </p>
      <p class="running-title" id="p274_runningTitle">
        <xsl:value-of select="tei:orgName"/>
      </p>
      <p class="volume-info" id="p274_vol">
        <xsl:value-of select="tei:p"/>
      </p>
    </div>
  </xsl:template>

  <xsl:template match="tei:div[@xml:id='pageHeader_276']">
    <div class="flex-full">
      <p class="page-number" id="p276_number">
        <xsl:value-of select="tei:num"/>
      </p>
      <p class="running-title" id="p276_runningTitle">
        <xsl:value-of select="tei:orgName"/>
      </p>
      <p class="volume-info" id="p276_vol">
        <xsl:value-of select="tei:p"/>
      </p>
    </div>
  </xsl:template>

  <xsl:template match="tei:div[@xml:id='pageHeader_275']">
    <div class="flex-full">
      <p class="page-date" id="p275_date">
        <xsl:value-of select="tei:date"/>
      </p>
      <p class="running-title" id="p275_runningTitle">
        <xsl:value-of select="tei:orgName"/>
      </p>
      <p class="number-info" id="p275_number">
        <xsl:value-of select="tei:num"/>
      </p>
    </div>
  </xsl:template>

  <xsl:template match="tei:div[@xml:id='pageHeader_275_com']">
    <div class="flex-full">
      <p class="page-date" id="p275_date_com">
        <xsl:value-of select="tei:date"/>
      </p>
      <p class="running-title" id="p275_runningTitle_com">
        <xsl:value-of select="tei:orgName"/>
      </p>
      <p class="number-info" id="p275_number_com">
        <xsl:value-of select="tei:num"/>
      </p>
    </div>
  </xsl:template>

  <xsl:template match="tei:persName">
    <span class="persone-reali">
      <xsl:attribute name="data-ref">
        <xsl:value-of select="@ref"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:orgName">
    <span class="organizzazioni">
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
    <span class="luoghi-geografici">
      <xsl:attribute name="data-ref">
        <xsl:value-of select="@ref"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:term">
    <xsl:choose>
      <xsl:when test="@type = 'Verbum' or @type = 'verbum'">
        <span class="verbum">
          <xsl:apply-templates/>
        </span>
      </xsl:when>
      <xsl:when test="@type = 'temi_motivi'">
        <span class="temi-motivi">
          <xsl:apply-templates/>
        </span>
      </xsl:when>
      <xsl:otherwise>
        <span class="term">
          <xsl:apply-templates/>
        </span>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:title">
    <span class="opere">
      <xsl:apply-templates/>
    </span>
  </xsl:template>


  <xsl:template match="tei:date">
    <span class="date">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:head">
    <h4 class="page-header">
      <xsl:apply-templates/>
    </h4>
  </xsl:template>

  <xsl:template match="tei:num">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="tei:div[@xml:id='p273_date']">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="tei:bibl[not(ancestor::tei:listBibl)]">
    <span class="opere">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:quote">
    <span class="citazioni">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:rs[@type='epithet']">
    <span class="epithet">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:rs[@type='correnti_letterarie']">
    <span class="correnti-letterarie">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:rs[@type='temi_motivi']">
    <span class="temi-motivi">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:rs[@type='luoghi_naturali']">
    <span class="luoghi-naturali">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:bibl[ancestor::tei:listBibl]" priority="1">
    <div class="bibliographic-entry">
      <h3 class="bibliographic-title">
        <xsl:apply-templates select="tei:title"/>
      </h3>
      <p>
        <xsl:if test="tei:author and normalize-space(tei:author) != ''">
          <span class="bibliographic-author">
            <xsl:text>Autore: </xsl:text>
            <xsl:apply-templates select="tei:author"/>
          </span>
          <xsl:text>. </xsl:text>
        </xsl:if>
        <xsl:if test="tei:imprint">
          <span class="bibliographic-publication">
            <xsl:if test="tei:imprint/tei:pubPlace and normalize-space(tei:imprint/tei:pubPlace) != ''">
              <xsl:text>Pubblicato a </xsl:text>
              <xsl:apply-templates select="tei:imprint/tei:pubPlace/tei:placeName"/>
            </xsl:if>
            <xsl:if test="tei:imprint/tei:publisher and normalize-space(tei:imprint/tei:publisher) != ''">
              <xsl:text> da </xsl:text>
              <xsl:apply-templates select="tei:imprint/tei:publisher/tei:orgName"/>
            </xsl:if>
            <xsl:if test="tei:imprint/tei:date and normalize-space(tei:imprint/tei:date) != ''">
              <xsl:text> in data </xsl:text>
              <xsl:apply-templates select="tei:imprint/tei:date"/>
            </xsl:if>
          </span>
          <xsl:text>. </xsl:text>
        </xsl:if>
        <xsl:if test="tei:biblScope[@unit='page'] and normalize-space(tei:biblScope[@unit='page']) != ''">
          <span class="bibliographic-pages">
            <xsl:text>Pagine: </xsl:text>
            <xsl:apply-templates select="tei:biblScope[@unit='page']"/>
          </span>
          <xsl:text>. </xsl:text>
        </xsl:if>
        <xsl:if test="tei:note and normalize-space(tei:note) != ''">
          <span class="bibliographic-note">
            <xsl:text>Note: </xsl:text>
            <xsl:apply-templates select="tei:note"/>
          </span>
        </xsl:if>
      </p>
    </div>
  </xsl:template>

  <xsl:template match="tei:bibl[@xml:id='notizie_gustavo_dugaut']">
    <div class="notizie-entry">
      <h3 class="notizie-title">
        <xsl:value-of select="tei:title"/>
      </h3>
      <p>
        <xsl:text>Autore: </xsl:text>
        <span class="notizie-author">
          <xsl:apply-templates select="tei:author"/>
        </span>
        <xsl:text>. Pubblicato a </xsl:text>
        <span class="notizie-publication">
          <xsl:apply-templates select="tei:imprint/tei:pubPlace/tei:placeName"/>
        </span>
        <xsl:text> da </xsl:text>
        <span class="notizie-publisher">
          <xsl:apply-templates select="tei:imprint/tei:publisher/tei:orgName"/>
        </span>
        <xsl:text>. Pagine: </xsl:text>
        <span class="notizie-pages">
          <xsl:value-of select="tei:biblScope"/>
        </span>
      </p>
    </div>
</xsl:template>

<xsl:template match="tei:bibl[@xml:id='notizie_errata_corrige']">
    <div class="notizie-entry">
      <h3 class="notizie-title">
        <xsl:value-of select="tei:title"/>
      </h3>
      <p>
        <xsl:text>Pagine: </xsl:text>
        <span class="notizie-pages">
          <xsl:value-of select="tei:biblScope"/>
        </span>
        <xsl:text>. </xsl:text>
        <span class="notizie-note">
          <xsl:apply-templates select="tei:note"/>
        </span>
      </p>
    </div>
</xsl:template>

  <xsl:template match="tei:pubPlace">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="tei:publisher">
    <xsl:apply-templates/>
  </xsl:template>
  

</xsl:stylesheet>