Feature: Json Feature Testing

  Scenario:Json reader or parser
    * def jsonObject =
    """
    [
    {
      "name" : "David",
      "City" : "Hobart",
      "Age" : 32
    },

     {
      "name" : "Smith",
      "City" : "Perth",
      "Age" : 34
    }
    ]
    """
    * print jsonObject
    * print jsonObject[0].name
    * print jsonObject[1].name + " " + jsonObject[1].Age

    Scenario: Complex Json Example
      * def jsonObject =
      """

{
    "glossary": {
        "title": "example glossary",
		"GlossDiv": {
            "title": "S",
			"GlossList": {
                "GlossEntry": {
                    "ID": "SGML",
					"SortAs": "SGML",
					"GlossTerm": "Standard Generalized Markup Language",
					"Acronym": "SGML",
					"Abbrev": "ISO 8879:1986",
					"GlossDef": {
                        "para": "A meta-markup language, used to create markup languages such as DocBook.",
						"GlossSeeAlso": ["GML", "XML"]
                    },
					"GlossSee": "markup"
                }
            }
        }
    }
}
      """

      * print jsonObject
      * print jsonObject.glossary.GlossDiv.GlossList.GlossEntry.Abbrev
      * print jsonObject.glossary.GlossDiv

