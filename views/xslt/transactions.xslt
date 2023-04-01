<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Bank Data</title>
                <!-- <style type="text/css">
                 
                </style> -->
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
                    integrity="sha512-BAmP18o8QwTHV7+LtwOKJZVxhZ8JKOuX7vkw5zo5uV7ewy+0stWVzvBhncOjJHr0qG3+X9lOSjQGbMGb0yuuOA=="
                    crossorigin="anonymous" referrerpolicy="no-referrer" />

            </head>
            <body>
                <div class="navbar">
                    <a href="#">Home</a>
                    <a href="#">
                        About</a>
                    <a href="#">Contact</a>
                </div>
                <div class="container">
                    <h2>Current Balance: <xsl:value-of select="bank/balance" />$</h2>
                    <h3>Recent
                        Transactions:</h3>
                    <table border="1">
                        <tr bgcolor="#9acd32">
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
                                    <xsl:value-of select="amount" />
        $ </td>
                                <td>
                                    <xsl:value-of select="date" />
                                </td>
                                <td>
                                    <xsl:value-of select="description" />
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    <a href="#">
                        <img src="img/bg.png" alt="Image description" />
                    </a>
                </div>
                <div class="footer">
                    <div>
                        <img src="img/logo.png" alt="Bank logo" />
                    </div>

                    <div>
                        <p>Footer
                            text goes here</p>
                    </div>

                    <div>
                        <p>Social Media</p>
                        <ul class="social-media">
                            <li>
                                <a href="https://www.facebook.com">
                                    <i class="fab fa-facebook-f"></i>
                                </a>
                            </li>
                            <li>
                                <a href="https://twitter.com">
                                    <i class="fab fa-twitter"></i>
                                </a>
                            </li>
                            <li>
                                <a href="https://www.instagram.com">
                                    <i class="fab fa-instagram"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>