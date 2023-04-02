<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Bank Data</title>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
                    crossorigin="anonymous" referrerpolicy="no-referrer" />
                <?xml-stylesheet type="text/xsl" href="path/to/your/xslt/file.xsl"?>


            </head>
            <body>
                <div class="navbar">
                    <a href="#">Home</a>
                    <a href="#">
                        About</a>
                    <a href="#">Contact</a>
                </div>
                <main>
                    <div class="container">
                        <h2>Current Balance: <xsl:value-of
                                select="bank/balance" />$</h2>
                        <h3>Recent
                            Transactions:</h3>
                        <table border="1">
                            <tr>
                                <th>
                                    ID</th>
                                <th>Amount</th>
                                <th>Date</th>
                                <th>Description</th>
                                <th>Flow</th>
                            </tr>
                            <xsl:for-each select="bank/recent_transactions/transactions">
                                <tr>
                                    <td>
                                        <xsl:value-of select="@id" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="operator" /> 
                                    <xsl:value-of
                                            select="amount" /> $ </td>
                                    <td>
                                        <xsl:value-of select="date" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="description" />
                                    </td>

                                    <td>
                                        <xsl:choose>
                                            <xsl:when test="operator = '+'">Income</xsl:when>
                                            <xsl:when test="operator = '-'">Loss</xsl:when>
                                            <xsl:otherwise>Unknown</xsl:otherwise>
                                        </xsl:choose>
                                    </td>


                                </tr>
                            </xsl:for-each>
                        </table>
                        <div class="button_container">
                            <div class="button_div">
                                <button onclick="generateExcel()">Generate
                                    Excel</button>
                            </div>
                            <div class="button_div">
                                <button onclick="showTransactionData()">Generate
                                    View</button>
                            </div>
                        </div>
                        <div class="hero_image">
                            <a href="#">
                                <img src="img/bg.png" alt="Image description" />
                            </a>
                        </div>

                    </div>
                </main>
                <div class="footer">
                    <div>
                        <img src="img/footer_logo.png" alt="Bank logo" />
                    </div>

                    <div>
                        <p>This website is a banking app designed for managing transactions and
        accounting, utilizing the power of 7 programming languages to create an
                            efficient and enjoyable user experience.</p>
                    </div>

                    <div>
                        <p>Social
                            Media</p>
                        <ul class="social-media">
                            <span>
                                <a href="https://www.facebook.com">
                                    <i class="fab fa-facebook-f"></i>
                                </a>
                            </span>
                            <span>
                                <a href="https://twitter.com">
                                    <i class="fab fa-twitter"></i>
                                </a>
                            </span>
                            <span>
                                <a href="https://www.instagram.com">
                                    <i class="fab fa-instagram"></i>
                                </a>
                            </span>
                        </ul>
                    </div>
                </div>

                <script
                    lang="javascript"
                    src="https://cdn.sheetjs.com/xlsx-0.19.2/package/dist/xlsx.full.min.js"></script>
                <script
                    lang="javascript" src="js/main.js"></script>


            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>