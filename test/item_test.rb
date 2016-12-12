require 'test_helper'

module CONTENTdmAPI
  describe Item do
    describe "when a valid compound record has been requested" do
      it 'produces a single ruby hash representing the item' do
        VCR.use_cassette("valid_compound_request") do
          compound = Item.new(base_url: 'https://server16022.contentdm.oclc.org/dmwebservices/index.php', collection: 'p16022coll39', id: 446)
          result = compound.metadata
          result.must_equal({"title"=>"Catalogue for the second annual exhibition of the work of Minneapolis artists, November 4-30, 1916, at the Minneapolis Institute of Arts (Minneapolis, Minnesota) / Artists' League of Minneapolis; Minneapolis School of Art Alumni Association; Attic Club; Twin City Keramic Club; Minneapolis Society of Fine Arts; Minneapolis Institute of Arts", "photog"=>"Artists' League of Minneapolis; Minneapolis School of Art Alumni Association", "contri"=>"Attic Club (Minneapolis, Minnesota); Twin City Keramic Club; Minneapolis Society of Fine Arts; Minneapolis Institute of Arts", "descri"=>"Variant title: Work of Minneapolis artists, November 4-30, 1916. Title from cover. \"The exhibition is under the auspices of the Artists' League of Minneapolis, the Alumni Association of the Minneapolis School of Art, the Attic Club of Minneapolis, the Twin City Keramic Club, and the Minneapolis Society of Fine Arts.\"--Page 2. Includes a list of the jury on admission which also served as a Committee on Arrangements. 8 unnumbered pages.", "dat"=>"1916?", "publia"=>"Minneapolis Institute of Arts (Minneapolis, Minnesota)", "dimens"=>"16", "genera"=>"The Arts", "type"=>"Text", "physic"=>"Exhibition Catalogs", "specif"=>"Museum exhibits", "subjec"=>"Minneapolis Institute of Arts -- Exhibitions; Minneapolis Institute of Arts -- History; Minneapolis Institute of Arts -- Exhibitions -- 1916; Art, American -- 20th century -- Exhibitions; Artists -- Minnesota -- Minneapolis -- Exhibitions; Art -- Competitions --Minnesota -- Exhibitions; Art -- Minnesota -- Minneapolis -- Exhibitions; Minnesota -- In art -- Exhibitions", "city"=>"Minneapolis", "distri"=>{}, "county"=>"Hennepin", "state"=>"Minnesota", "countr"=>"United States", "geogra"=>{}, "geonam"=>"http://sws.geonames.org/9409898/", "litora"=>{}, "princi"=>{}, "geogrb"=>{}, "langua"=>"English", "parent"=>{}, "contra"=>"Minneapolis Institute of Arts", "contac"=>"Minneapolis Institute of Arts, Archives, Art Research & Reference Library, 2400 Third Avenue South, Minneapolis, Minnesota 55404 http://www.artsmia.org", "righta"=>"Use is governed by U.S. and international copyright law. It is the responsibility of researchers to obtain permission from all copyright holders before publication.", "identi"=>"36765", "resour"=>{}, "projec"=>"Minnesota Reflections 2013-14", "fiscal"=>"Funding provided to the Minnesota Digital Library through the Minnesota Arts and Cultural Heritage Fund, a component of the Minnesota Clean Water, Land and Legacy constitutional amendment, ratified by Minnesota voters in 2008.", "publis"=>{}, "date"=>{}, "format"=>{}, "digspe"=>{}, "digspa"=>{}, "digspb"=>{}, "digspc"=>{}, "digspd"=>{}, "digspf"=>{}, "digspg"=>{}, "digsph"=>{}, "digspi"=>{}, "digspj"=>{}, "digspk"=>{}, "transc"=>{}, "transl"=>{}, "fullrs"=>{}, "find"=>"447.cpd", "dmaccess"=>{}, "dmimage"=>{}, "dmcreated"=>"2016-10-11", "dmmodified"=>"2016-10-11", "dmoclcno"=>{}, "dmrecord"=>"446", "restrictionCode"=>"1", "cdmfilesize"=>"1180", "cdmfilesizeformatted"=>"0.00 MB", "cdmprintpdf"=>"0", "cdmhasocr"=>"0", "cdmisnewspaper"=>"0", "page"=>[{"pagetitle"=>"Title page", "pagefile"=>"439.jp2", "pageptr"=>"438", "title"=>"Title page", "photog"=>{}, "contri"=>{}, "descri"=>{}, "dat"=>{}, "publia"=>{}, "dimens"=>{}, "genera"=>{}, "type"=>{}, "physic"=>{}, "specif"=>{}, "subjec"=>{}, "city"=>{}, "distri"=>{}, "county"=>{}, "state"=>{}, "countr"=>{}, "geogra"=>{}, "geonam"=>{}, "litora"=>{}, "princi"=>{}, "geogrb"=>{}, "langua"=>{}, "parent"=>{}, "contra"=>{}, "contac"=>{}, "righta"=>{}, "identi"=>"36765", "resour"=>"umn256695", "projec"=>{}, "fiscal"=>{}, "publis"=>"University of Minnesota", "date"=>"10/15/2013 14:24", "format"=>"image/jp2", "digspe"=>"image/tiff", "digspa"=>"8161706", "digspb"=>"24", "digspc"=>"300", "digspd"=>"none", "digspf"=>"1288", "digspg"=>"2110", "digsph"=>"CopiBook", "digspi"=>"Adobe Photoshop CS", "digspj"=>"Windows XP", "digspk"=>"50efa6d32be6de97cd0178256570c663", "transc"=>"SECOND ANNUAL\nEXHIBITION\nWORK OF MINNEAPOLIS ARTISTS\nNOVEMBER 4-30, 1916\nTHE   MINNEAPOLIS\nI NSTITUTE  OF  ARTS", "transl"=>{}, "fullrs"=>{}, "find"=>"439.jp2", "dmaccess"=>{}, "dmimage"=>{}, "dmcreated"=>"2014-09-11", "dmmodified"=>"2014-09-11", "dmoclcno"=>{}, "dmrecord"=>"438", "restrictionCode"=>"1", "cdmfilesize"=>"220144", "cdmfilesizeformatted"=>"0.21 MB", "cdmprintpdf"=>"0", "cdmhasocr"=>"1", "cdmisnewspaper"=>"0", "id"=>"p16022coll39/438", "page"=>[]}, {"pagetitle"=>"Catalogue, Paintings 1-4", "pagefile"=>"440.jp2", "pageptr"=>"439", "title"=>"Catalogue, Paintings 1-4", "photog"=>{}, "contri"=>{}, "descri"=>{}, "dat"=>{}, "publia"=>{}, "dimens"=>{}, "genera"=>{}, "type"=>{}, "physic"=>{}, "specif"=>{}, "subjec"=>{}, "city"=>{}, "distri"=>{}, "county"=>{}, "state"=>{}, "countr"=>{}, "geogra"=>{}, "geonam"=>{}, "litora"=>{}, "princi"=>{}, "geogrb"=>{}, "langua"=>{}, "parent"=>{}, "contra"=>{}, "contac"=>{}, "righta"=>{}, "identi"=>"36765", "resour"=>"umn256696", "projec"=>{}, "fiscal"=>{}, "publis"=>"University of Minnesota", "date"=>"10/15/2013 14:24", "format"=>"image/jp2", "digspe"=>"image/tiff", "digspa"=>"7433756", "digspb"=>"24", "digspc"=>"300", "digspd"=>"none", "digspf"=>"1173", "digspg"=>"2110", "digsph"=>"CopiBook", "digspi"=>"Adobe Photoshop CS", "digspj"=>"Windows XP", "digspk"=>"5661c16ea137ee121c5c8e4f5c4464c4", "transc"=>"THE EXHIBITION is under the\nauspices of the Artists' League\nof Minneapolis, the Alumni Association of the Minneapolis School of\nArt, the Attic Club of Minneapolis, the\nTwin City Keramic Club, and the Minneapolis Society of Fine Arts.\nThe Jury on Admission was composed of five members representing\nthe different societies. The Jury,\nwhich also served as a Committee on\nArrangements, consisted of Joseph\nBreck, Chairman, Minneapolis Society of Fine Arts; Mrs. Gertrude J.\nBarnes, Artists' League of Minneapolis; Miss Isabelle Crawford, Alumni\nAssociation of the Minneapolis School\nof Art; Lee Mero, Attic Club of Minneapolis; and Miss Florence Huntington, Twin City Keramic Club.\nMost of the work in this exhibition is\nfor sale. Prices may be obtained at\nthe Information Desk,  Main Entrance.\nCATALOGUE\nPAINTINGS\nBARNES, MRS. GERTRUDE J.\n1. A Bowl  of Roses\n2. The  Fishing Village\n3. Minnesota Bluff and Birches\nBETLATCH, J. W.\n4.     Landscape", "transl"=>{}, "fullrs"=>{}, "find"=>"440.jp2", "dmaccess"=>{}, "dmimage"=>{}, "dmcreated"=>"2014-09-11", "dmmodified"=>"2014-09-11", "dmoclcno"=>{}, "dmrecord"=>"439", "restrictionCode"=>"1", "cdmfilesize"=>"188327", "cdmfilesizeformatted"=>"0.18 MB", "cdmprintpdf"=>"0", "cdmhasocr"=>"1", "cdmisnewspaper"=>"0", "id"=>"p16022coll39/439", "page"=>[]}, {"pagetitle"=>"Paintings 5-25", "pagefile"=>"441.jp2", "pageptr"=>"440", "title"=>"Paintings 5-25", "photog"=>{}, "contri"=>{}, "descri"=>{}, "dat"=>{}, "publia"=>{}, "dimens"=>{}, "genera"=>{}, "type"=>{}, "physic"=>{}, "specif"=>{}, "subjec"=>{}, "city"=>{}, "distri"=>{}, "county"=>{}, "state"=>{}, "countr"=>{}, "geogra"=>{}, "geonam"=>{}, "litora"=>{}, "princi"=>{}, "geogrb"=>{}, "langua"=>{}, "parent"=>{}, "contra"=>{}, "contac"=>{}, "righta"=>{}, "identi"=>"36765", "resour"=>"umn256697", "projec"=>{}, "fiscal"=>{}, "publis"=>"University of Minnesota", "date"=>"10/15/2013 14:24", "format"=>"image/jp2", "digspe"=>"image/tiff", "digspa"=>"7433756", "digspb"=>"24", "digspc"=>"300", "digspd"=>"none", "digspf"=>"1173", "digspg"=>"2110", "digsph"=>"CopiBook", "digspi"=>"Adobe Photoshop CS", "digspj"=>"Windows XP", "digspk"=>"91a7cde8915f3f294d4049b2d7573e53", "transc"=>"BRECK, JOSEPH\n5. The Lonely Beach\n6. Meeting the Boat\n7. Grey Day\nBREWER, ADRIAN L.\n8. The Duck Pass\nBURTON, SAMUEL CHATWOOD\n9. Lazy Boats\n1 0.     Provincetown  from the Sea\n1 1.     Boats at Anchor,  Provincetown\nCARLSON, GORHAM\n1 2.      Halsted Bay\nCHENEY,   MARY  MOULTON\n13. Old White House\n14. Old Fish Houses\n15. The   Red-end   House\nDALE, FREDERIC C.\n16. Looking North\nDAWES, EDWIN M.\n1 7.     Harbor at Night\n18. The   Trout   Stream\nFOURNIER, MARIETTA\n19. The Road\nGALE, MARY\n20. New York from the Palisades\n2 1.      Poplars\n22. French Chalets\nGAUSTA, H.\n23. Evening\nGOETSCH, GUSTAV F.\n24. Evening\n25. Still Life", "transl"=>{}, "fullrs"=>{}, "find"=>"441.jp2", "dmaccess"=>{}, "dmimage"=>{}, "dmcreated"=>"2014-09-11", "dmmodified"=>"2014-09-11", "dmoclcno"=>{}, "dmrecord"=>"440", "restrictionCode"=>"1", "cdmfilesize"=>"224579", "cdmfilesizeformatted"=>"0.21 MB", "cdmprintpdf"=>"0", "cdmhasocr"=>"1", "cdmisnewspaper"=>"0", "id"=>"p16022coll39/440", "page"=>[]}, {"pagetitle"=>"Paintings 26-45", "pagefile"=>"442.jp2", "pageptr"=>"441", "title"=>"Paintings 26-45", "photog"=>{}, "contri"=>{}, "descri"=>{}, "dat"=>{}, "publia"=>{}, "dimens"=>{}, "genera"=>{}, "type"=>{}, "physic"=>{}, "specif"=>{}, "subjec"=>{}, "city"=>{}, "distri"=>{}, "county"=>{}, "state"=>{}, "countr"=>{}, "geogra"=>{}, "geonam"=>{}, "litora"=>{}, "princi"=>{}, "geogrb"=>{}, "langua"=>{}, "parent"=>{}, "contra"=>{}, "contac"=>{}, "righta"=>{}, "identi"=>"36765", "resour"=>"umn256698", "projec"=>{}, "fiscal"=>{}, "publis"=>"University of Minnesota", "date"=>"10/15/2013 14:24", "format"=>"image/jp2", "digspe"=>"image/tiff", "digspa"=>"7433756", "digspb"=>"24", "digspc"=>"300", "digspd"=>"none", "digspf"=>"1173", "digspg"=>"2110", "digsph"=>"CopiBook", "digspi"=>"Adobe Photoshop CS", "digspj"=>"Windows XP", "digspk"=>"95a6bf88af894cebb860aeb919e8064c", "transc"=>"GOUTTMAN,   CHARLES\n26. Portrait\nGREENMAN, FRANCES CRANMER\n27. Malmfried\n27A.     The  War   Mother\nHANSON, ARTHUR C.\n28. In the Northland\nHEWITT, EDWIN H.\n29. Girl with Violets\n30. Autumn\n3 I.     Across the Valley\n32. Willows\nHOFFMAN, BERNT ANKER\n33. Springtime\nJOHNSON, HARRISON WALL\n34. Spring Meadows\nKAISER, AUGUST\n35. Late  Afternoon\nKOEHLER, ROBERT\n36. The Young Tennis Champion\n37. Along   the   Shore,   Lake   Washington\n38. After Squirrels\nLINDAHL, AXEL J. G. M.\n39. At  Minnetonka\n40. From Lake Street Bridge\nMERO, LEE\n41. Early  Morning\nRAWSON, CARL W.\n42. Late October\n43. Across the Meadow\n44. Autumn Rain\n45. Portrait of Hon. Amos G. Webster", "transl"=>{}, "fullrs"=>{}, "find"=>"442.jp2", "dmaccess"=>{}, "dmimage"=>{}, "dmcreated"=>"2014-09-11", "dmmodified"=>"2014-09-11", "dmoclcno"=>{}, "dmrecord"=>"441", "restrictionCode"=>"1", "cdmfilesize"=>"240399", "cdmfilesizeformatted"=>"0.23 MB", "cdmprintpdf"=>"0", "cdmhasocr"=>"1", "cdmisnewspaper"=>"0", "id"=>"p16022coll39/441", "page"=>[]}, {"pagetitle"=>"Paintings 46-60, Sculpture 61-64", "pagefile"=>"443.jp2", "pageptr"=>"442", "title"=>"Paintings 46-60, Sculpture 61-64", "photog"=>{}, "contri"=>{}, "descri"=>{}, "dat"=>{}, "publia"=>{}, "dimens"=>{}, "genera"=>{}, "type"=>{}, "physic"=>{}, "specif"=>{}, "subjec"=>{}, "city"=>{}, "distri"=>{}, "county"=>{}, "state"=>{}, "countr"=>{}, "geogra"=>{}, "geonam"=>{}, "litora"=>{}, "princi"=>{}, "geogrb"=>{}, "langua"=>{}, "parent"=>{}, "contra"=>{}, "contac"=>{}, "righta"=>{}, "identi"=>"36765", "resour"=>"umn256699", "projec"=>{}, "fiscal"=>{}, "publis"=>"University of Minnesota", "date"=>"10/15/2013 14:24", "format"=>"image/jp2", "digspe"=>"image/tiff", "digspa"=>"7433756", "digspb"=>"24", "digspc"=>"300", "digspd"=>"none", "digspf"=>"1173", "digspg"=>"2110", "digsph"=>"CopiBook", "digspi"=>"Adobe Photoshop CS", "digspj"=>"Windows XP", "digspk"=>"3f4c7a0e709a90dd11dffdd4f6e30267", "transc"=>"RUBINS,\nH. W.\n46.\n47.\n48.\nThe Young Sculptor\nThe   Cottage\nEvening\nSIMPSON\nI, MARY E.\n49.\nHilltop\nSNYDER,\nCORYDON G.\n50.\n51\nDeserted\nMaster Stout,   Master  Mechanic\nSORTOR\n,   M.   L.\n52.\nAt  San   Diego\nWALLACE, AMY S.\n53.\nA  Wharf  at  Provincetown\nWITTER,\nELLA M.\n54.\n55.\n56.\nThe  Pasture  Creek\nPeonies\nThe Plum Trees\nWOLF, ADA\n57.\n58.\n59.\n60.\nStill   Life\nThe  Flats\nRuth\nThe Big Tree\nSCULPTURE.\nGALE, MARY\n61.\nSHOBERI\nKeats\nZ.  MRS.   IESSIE\n62. Baby   Head\nWHITE, MARGARET DEVOE\n63. Hiawatha  (Model for a fountain)\nWOODRUFF, MRS. CORICE\n64. Book-ends", "transl"=>{}, "fullrs"=>{}, "find"=>"443.jp2", "dmaccess"=>{}, "dmimage"=>{}, "dmcreated"=>"2014-09-11", "dmmodified"=>"2014-09-11", "dmoclcno"=>{}, "dmrecord"=>"442", "restrictionCode"=>"1", "cdmfilesize"=>"240162", "cdmfilesizeformatted"=>"0.23 MB", "cdmprintpdf"=>"0", "cdmhasocr"=>"1", "cdmisnewspaper"=>"0", "id"=>"p16022coll39/442", "page"=>[]}, {"pagetitle"=>"Prints and drawings 65-83, Commercial art 84-85", "pagefile"=>"444.jp2", "pageptr"=>"443", "title"=>"Prints and drawings 65-83, Commercial art 84-85", "photog"=>{}, "contri"=>{}, "descri"=>{}, "dat"=>{}, "publia"=>{}, "dimens"=>{}, "genera"=>{}, "type"=>{}, "physic"=>{}, "specif"=>{}, "subjec"=>{}, "city"=>{}, "distri"=>{}, "county"=>{}, "state"=>{}, "countr"=>{}, "geogra"=>{}, "geonam"=>{}, "litora"=>{}, "princi"=>{}, "geogrb"=>{}, "langua"=>{}, "parent"=>{}, "contra"=>{}, "contac"=>{}, "righta"=>{}, "identi"=>"36765", "resour"=>"umn256700", "projec"=>{}, "fiscal"=>{}, "publis"=>"University of Minnesota", "date"=>"10/15/2013 14:24", "format"=>"image/jp2", "digspe"=>"image/tiff", "digspa"=>"7433756", "digspb"=>"24", "digspc"=>"300", "digspd"=>"none", "digspf"=>"1173", "digspg"=>"2110", "digsph"=>"CopiBook", "digspi"=>"Adobe Photoshop CS", "digspj"=>"Windows XP", "digspk"=>"14901ea5439f5f44fa4eb68b56e847f0", "transc"=>"I\nPRINTS AND DRAWINGS.\nBELL, BARBARA\n65. Portrait Sketch, Ruth\n66. Portrait  Sketch,   Mary\nCHAPMAN,  GEORGE P.\n67. Sketch\nDEHN, ADOLPH A.\n68. Old  Woman  and  Geese\nGAG, WANDA\n69.\nStella\n70.\nDeli\nGOETSCH, GUSTAV F.\n71.\nValey of Saint Croix\n72.\nThe Street\n73.\nThe   Willows\n74.\nMinnehaha Creek\n75.\nMississippi   River\n76.\nThe  Elms\n77.\nThe River\n78.\nSecond Street\n79.\nOld Houses\nJONES, ROY CHILDS\n80. Piazza  San  Pietro,  Rome\n81. Pisano's   Fountain,   Perugia\n82. Libreria   Vecchia,   Venice\nWILWERDING,  WALTER  J.\n83. Studies of a Puma\nCOMMERCIAL ART\nBLACKBURN,  OSCAR T.\n84. Bookplates\nBORNARTH, LOUIS\n85. The Drop Kick", "transl"=>{}, "fullrs"=>{}, "find"=>"444.jp2", "dmaccess"=>{}, "dmimage"=>{}, "dmcreated"=>"2014-09-11", "dmmodified"=>"2014-09-11", "dmoclcno"=>{}, "dmrecord"=>"443", "restrictionCode"=>"1", "cdmfilesize"=>"232809", "cdmfilesizeformatted"=>"0.22 MB", "cdmprintpdf"=>"0", "cdmhasocr"=>"1", "cdmisnewspaper"=>"0", "id"=>"p16022coll39/443", "page"=>[]}, {"pagetitle"=>"Commercial art 86-95, Applied art 96-101", "pagefile"=>"445.jp2", "pageptr"=>"444", "title"=>"Commercial art 86-95, Applied art 96-101", "photog"=>{}, "contri"=>{}, "descri"=>{}, "dat"=>{}, "publia"=>{}, "dimens"=>{}, "genera"=>{}, "type"=>{}, "physic"=>{}, "specif"=>{}, "subjec"=>{}, "city"=>{}, "distri"=>{}, "county"=>{}, "state"=>{}, "countr"=>{}, "geogra"=>{}, "geonam"=>{}, "litora"=>{}, "princi"=>{}, "geogrb"=>{}, "langua"=>{}, "parent"=>{}, "contra"=>{}, "contac"=>{}, "righta"=>{}, "identi"=>"36765", "resour"=>"umn256701", "projec"=>{}, "fiscal"=>{}, "publis"=>"University of Minnesota", "date"=>"10/15/2013 14:24", "format"=>"image/jp2", "digspe"=>"image/tiff", "digspa"=>"7433756", "digspb"=>"24", "digspc"=>"300", "digspd"=>"none", "digspf"=>"1173", "digspg"=>"2110", "digsph"=>"CopiBook", "digspi"=>"Adobe Photoshop CS", "digspj"=>"Windows XP", "digspk"=>"3aa32ce8caf28ef7a34b0038667ccb86", "transc"=>"CARLSON, GORHAM\n86. Canadian   Woodpecker,     Linoleum\nPrint\nCRAWFORD, ISABEL\n87. Advertising   Poster\nHODGEMAN, DALLAS\n88. Magazine Cover\nKAISER, AUGUST\n89. Poster\n90. Poster\nKANE, KATHLEEN\n91. Illustration,   The  Golden  Castle  of\nStromberg\nLARSEN, ANDREAS R.\n92. Sketch   for   stained   glass,   Nativity\nMERO, LEE\n93. It   only  happens  in   the  Spring\nNELSON,  ORA L.\n94. Miss  Cheevus\nYOUNG, ROWENA\n95. Tiger   Lillie\nAPPLIED ART\nBEEDE. M. ETTA\n96. Chop Plate\nCOLEMAN, MRS. ARCH\n97. Vase\n98. Bird Tray\nCONKL1N,  MRS.  IDA PELL\n99. Bro6ch,  Cameo  and  Pearls\n100. Ring, Gold and Scarab\n101. Cross and Chain", "transl"=>{}, "fullrs"=>{}, "find"=>"445.jp2", "dmaccess"=>{}, "dmimage"=>{}, "dmcreated"=>"2014-09-11", "dmmodified"=>"2014-09-11", "dmoclcno"=>{}, "dmrecord"=>"444", "restrictionCode"=>"1", "cdmfilesize"=>"227766", "cdmfilesizeformatted"=>"0.22 MB", "cdmprintpdf"=>"0", "cdmhasocr"=>"1", "cdmisnewspaper"=>"0", "id"=>"p16022coll39/444", "page"=>[]}, {"pagetitle"=>"Applied art 102-122", "pagefile"=>"446.jp2", "pageptr"=>"445", "title"=>"Applied art 102-122", "photog"=>{}, "contri"=>{}, "descri"=>{}, "dat"=>{}, "publia"=>{}, "dimens"=>{}, "genera"=>{}, "type"=>{}, "physic"=>{}, "specif"=>{}, "subjec"=>{}, "city"=>{}, "distri"=>{}, "county"=>{}, "state"=>{}, "countr"=>{}, "geogra"=>{}, "geonam"=>{}, "litora"=>{}, "princi"=>{}, "geogrb"=>{}, "langua"=>{}, "parent"=>{}, "contra"=>{}, "contac"=>{}, "righta"=>{}, "identi"=>"36765", "resour"=>"umn256702", "projec"=>{}, "fiscal"=>{}, "publis"=>"University of Minnesota", "date"=>"10/15/2013 14:24", "format"=>"image/jp2", "digspe"=>"image/tiff", "digspa"=>"8073086", "digspb"=>"24", "digspc"=>"300", "digspd"=>"none", "digspf"=>"1274", "digspg"=>"2110", "digsph"=>"CopiBook", "digspi"=>"Adobe Photoshop CS", "digspj"=>"Windows XP", "digspk"=>"af7de7ed01d9a2a58d2777a9b6c604a5", "transc"=>"102.\nPendant and Chain, Silver\nPearl\n-gilt and\n103.\nBrooch,  Gold and Pearls\n104.\nPendant   and   Chain,   Abal\nSilver\none   and\n105.\nBrooch,  Amethyst and Silver\nGRAY, NELLIE J.\n106.\nBelleek Vase   (cylinder)\n107.\nBelleek Vase  (small)\n108.\nCup and Saucer\nHANDICRAFT GUILD\n109.\nDesk Set, Enameled Copper\nKOENIG\nNELL\n110.\nBelleek Punch Bowl\n111.\nBon-bon   Box,   Satsuma\n112.\nTray,   Belleek\nMOWBRAY, L. ALTHEA\n113.\nSmall Bowl, Enamel Decoration\n114.\nCard Tray, Acid Etched\nNEWMAN, FRANCES E.\n115.\nTile, Enamel Decoration\nSCHIBSBY, FANNY\n116.\nStenciled Curtain\nSOULEN\nHARVEY H.\n117.\nCarved   Lamp\n118.\nRosewood   and   Mahogany\nsticks\nCandle-\nWHITE,\nORA VALETTA\n119.\nSatsuma Bowl\nWIARD,\nC. L.\n120.\nBelleek Marmalade Jar\n121.\nCandlestick\n122.\nHexagonal  Belleek   Vase", "transl"=>{}, "fullrs"=>{}, "find"=>"446.jp2", "dmaccess"=>{}, "dmimage"=>{}, "dmcreated"=>"2014-09-11", "dmmodified"=>"2014-09-11", "dmoclcno"=>{}, "dmrecord"=>"445", "restrictionCode"=>"1", "cdmfilesize"=>"236999", "cdmfilesizeformatted"=>"0.23 MB", "cdmprintpdf"=>"0", "cdmhasocr"=>"1", "cdmisnewspaper"=>"0", "id"=>"p16022coll39/445", "page"=>[]}], "id"=>"p16022coll39/446"})
        end
      end

      describe 'but no compound item has been requested' do
        it 'returns a hash for the item' do
          VCR.use_cassette('valid_item_request_without_compound') do
            compound = Item.new(with_compound: false, base_url: 'https://server16022.contentdm.oclc.org/dmwebservices/index.php', collection: 'p16022coll39', id: 446)
            compound.metadata.must_equal({"title"=>"Catalogue for the second annual exhibition of the work of Minneapolis artists, November 4-30, 1916, at the Minneapolis Institute of Arts (Minneapolis, Minnesota) / Artists' League of Minneapolis; Minneapolis School of Art Alumni Association; Attic Club; Twin City Keramic Club; Minneapolis Society of Fine Arts; Minneapolis Institute of Arts", "photog"=>"Artists' League of Minneapolis; Minneapolis School of Art Alumni Association", "contri"=>"Attic Club (Minneapolis, Minnesota); Twin City Keramic Club; Minneapolis Society of Fine Arts; Minneapolis Institute of Arts", "descri"=>"Variant title: Work of Minneapolis artists, November 4-30, 1916. Title from cover. \"The exhibition is under the auspices of the Artists' League of Minneapolis, the Alumni Association of the Minneapolis School of Art, the Attic Club of Minneapolis, the Twin City Keramic Club, and the Minneapolis Society of Fine Arts.\"--Page 2. Includes a list of the jury on admission which also served as a Committee on Arrangements. 8 unnumbered pages.", "dat"=>"1916?", "publia"=>"Minneapolis Institute of Arts (Minneapolis, Minnesota)", "dimens"=>"16", "genera"=>"The Arts", "type"=>"Text", "physic"=>"Exhibition Catalogs", "specif"=>"Museum exhibits", "subjec"=>"Minneapolis Institute of Arts -- Exhibitions; Minneapolis Institute of Arts -- History; Minneapolis Institute of Arts -- Exhibitions -- 1916; Art, American -- 20th century -- Exhibitions; Artists -- Minnesota -- Minneapolis -- Exhibitions; Art -- Competitions --Minnesota -- Exhibitions; Art -- Minnesota -- Minneapolis -- Exhibitions; Minnesota -- In art -- Exhibitions", "city"=>"Minneapolis", "distri"=>{}, "county"=>"Hennepin", "state"=>"Minnesota", "countr"=>"United States", "geogra"=>{}, "geonam"=>"http://sws.geonames.org/9409898/", "litora"=>{}, "princi"=>{}, "geogrb"=>{}, "langua"=>"English", "parent"=>{}, "contra"=>"Minneapolis Institute of Arts", "contac"=>"Minneapolis Institute of Arts, Archives, Art Research & Reference Library, 2400 Third Avenue South, Minneapolis, Minnesota 55404 http://www.artsmia.org", "righta"=>"Use is governed by U.S. and international copyright law. It is the responsibility of researchers to obtain permission from all copyright holders before publication.", "identi"=>"36765", "resour"=>{}, "projec"=>"Minnesota Reflections 2013-14", "fiscal"=>"Funding provided to the Minnesota Digital Library through the Minnesota Arts and Cultural Heritage Fund, a component of the Minnesota Clean Water, Land and Legacy constitutional amendment, ratified by Minnesota voters in 2008.", "publis"=>{}, "date"=>{}, "format"=>{}, "digspe"=>{}, "digspa"=>{}, "digspb"=>{}, "digspc"=>{}, "digspd"=>{}, "digspf"=>{}, "digspg"=>{}, "digsph"=>{}, "digspi"=>{}, "digspj"=>{}, "digspk"=>{}, "transc"=>{}, "transl"=>{}, "fullrs"=>{}, "find"=>"447.cpd", "dmaccess"=>{}, "dmimage"=>{}, "dmcreated"=>"2016-10-11", "dmmodified"=>"2016-10-11", "dmoclcno"=>{}, "dmrecord"=>"446", "restrictionCode"=>"1", "cdmfilesize"=>"1180", "cdmfilesizeformatted"=>"0.00 MB", "cdmprintpdf"=>"0", "cdmhasocr"=>"0", "cdmisnewspaper"=>"0", "id"=>"p16022coll39/446", "page"=>[]})
          end
        end
      end

      describe 'when an item presents an array of arrays for compounds instead of an array of hashes' do
        it 'returns an empty compound' do
          VCR.use_cassette('valid_item_request_with_invalid_compound') do
            compound = Item.new(with_compound: false, base_url: 'https://server16022.contentdm.oclc.org/dmwebservices/index.php', collection: 'gust', id: 373)
            compound.metadata.must_equal({"title"=>"Message of thanks from Saratov University to students of Gustavus Adolphus, St. Peter, Minnesota", "photog"=>"Students of Saratov University", "contri"=>"Wold & Baklund Portrait Gallery (Willmar, Minnesota)", "descri"=>"A drought, coupled with massive economic and social restructuring during the Russian Revolution, resulted in a devastating famine in 1921-1922 in the Volga region, which includes the City of Saratov.  Gustavus students and faculty responded to an appeal from the National Lutheran Council in late 1921 with a contribution of $395.25 toward Russian relief.  This letter of thanks, with parallel text in Russian and English, was written and illustrated by students of German ancestry enrolled at Saratov University.", "dat"=>"1922-05-07", "publia"=>{}, "dimens"=>"38.5 x 24", "genera"=>"Education", "type"=>"Text", "physic"=>"Letters (correspondence)", "specif"=>"College Students; Soviet Union History Revolution, 1917-1921;", "subjec"=>"Saratov State University; Relief; Outreach", "city"=>"St. Peter", "distri"=>{}, "county"=>"Nicollet", "state"=>"Minnesota", "countr"=>"United States", "geogra"=>{}, "geonam"=>"http://sws.geonames.org/5029064/", "latitu"=>{}, "longit"=>{}, "geogrb"=>{}, "langua"=>"English", "par"=>{}, "contra"=>"Gustavus Adolphus College", "contac"=>"Gustavus Adolphus College, 800 West College Avenue, St. Peter, MN 56082 http://gustavus.edu", "righta"=>"May not be published or extensively quoted without the permission of Gustavus Adolphus College.", "identi"=>"0000-0017-1", "resour"=>{}, "projec"=>"Minnesota Reflections 2005-06", "fiscal"=>"Grant provided to the Minnesota Digital Library Coalition through the Library Services and Technology Act (LSTA) and the State Library Services and School Technology unit of the Minnesota Department of Education", "publis"=>{}, "date"=>{}, "format"=>{}, "digspe"=>{}, "digspa"=>{}, "digspb"=>{}, "digspc"=>{}, "digspd"=>{}, "digspf"=>{}, "digspg"=>{}, "digsph"=>{}, "digspi"=>{}, "digspj"=>{}, "digspk"=>{}, "transc"=>{}, "transl"=>{}, "fullrs"=>{}, "find"=>"269.cpd", "dmaccess"=>{}, "dmimage"=>{}, "dmcreated"=>"2016-10-26", "dmmodified"=>"2016-10-26", "dmoclcno"=>{}, "dmrecord"=>"373", "restrictionCode"=>"1", "cdmfilesize"=>"213", "cdmfilesizeformatted"=>"0.00 MB", "cdmprintpdf"=>"0", "cdmhasocr"=>"0", "cdmisnewspaper"=>"0", "id"=>"gust/373", "page"=>[]})
          end
        end
      end
    end
  end
end