<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Bank Data</title>
            </head>
            <body>
                <div class="container">
                    <h2>Current Balance: <xsl:value-of select="bank/balance" />$</h2>
                    <h3>Recent Transactions:</h3>
                    <table border="1">
                        <tr bgcolor="#9acd32">
                            <th>ID</th>
                            <th>Amount</th>
                            <th>Date</th>
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
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>