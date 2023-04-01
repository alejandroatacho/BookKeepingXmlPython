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
                                </tr>
                            </xsl:for-each>
                        </table>
                        <button onclick="generateExcel()">Generate
                            Excel</button>

                        <a href="#">
                            <img src="img/bg.png" alt="Image description" height="250px"
                                width="auto" />
                        </a>
                    </div>
                </main>
                <div class="footer">
                    <div>
                        <img src="img/logo.png" alt="Bank logo" />
                    </div>

                    <div>
                        <p>As
                            the use of technology becomes increasingly prevalent in our daily
                            lives, it is important to remain mindful of its impact on ourselves
                            and society as a whole. This website footer aims to tell a basic
                            story about responsible usage and how it can contribute to a more
        sustainable future for all. It encourages visitors to question their
                            own habits and make conscious decisions when it comes to utilizing
        technology. By showcasing the benefits of thoughtful use, we hope to
                            inspire individuals all around the globe to adopt similar practices
                            in order to reduce their ecological footprint and persevere
                            resources for generations to come. Whether it be through conserving
        energy or properly disposing of electronics, every action taken
                            contributes towards the larger goal of creating a healthier
                            environment for both people and planet alike.</p>
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