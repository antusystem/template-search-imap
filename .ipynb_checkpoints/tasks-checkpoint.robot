*** Settings ***
Documentation   Searching Email with IMAP
Library         RPA.Email.ImapSmtp    smtp_server=smtp.gmail.com    smtp_port=587
Library         RPA.Robocloud.Secrets


*** Keyword *** 
Search Methods with IMAP
    [Documentation]    This Keywords shows how to use all the search keys from IMAP. 
    ...             This links where help a lot: https://tools.ietf.org/html/rfc3501#section-6.4.4 , https://gist.github.com/martinrusev/6121028 , 
    ...             https://robocorp.com/docs/development-guide/email/sending-emails-with-gmail-smtp#listing-email-messages-by-criterion

    # Access your email with your credential that are in the vault.json specified in the devdata/env.json file
    ${secret}=    Get Secret    emailCredentials
    Authorize    account=${secret}[username]   password=${secret}[password]
    
    
    #First of all, there are search keys that do not requiere any argument, those I call them flag search keys (DELETED, ALL, ANSWERED, and others)
    #In the documentation in here: https://tools.ietf.org/html/rfc3501#page-81 , you can check the search, search-key, and sequence-set to clear some doubt for some doubts 
    #that will come in the use of some search key. Either way I will copy them here:
    
    #search          = "SEARCH" [SP "CHARSET" SP astring] 1*(SP search-key)
    #                ; CHARSET argument to MUST be registered with IANA

    #search-key      = "ALL" / "ANSWERED" / "BCC" SP astring /
    #             "BEFORE" SP date / "BODY" SP astring /
    #              "CC" SP astring / "DELETED" / "FLAGGED" /
    #              "FROM" SP astring / "KEYWORD" SP flag-keyword /
    #              "NEW" / "OLD" / "ON" SP date / "RECENT" / "SEEN" /
    #              "SINCE" SP date / "SUBJECT" SP astring /
    #              "TEXT" SP astring / "TO" SP astring /
    #              "UNANSWERED" / "UNDELETED" / "UNFLAGGED" /
    #              "UNKEYWORD" SP flag-keyword / "UNSEEN" /
    #                ; Above this line were in [IMAP2]
    #              "DRAFT" / "HEADER" SP header-fld-name SP astring /
    #              "LARGER" SP number / "NOT" SP search-key /
    #              "OR" SP search-key SP search-key /
    #              "SENTBEFORE" SP date / "SENTON" SP date /
    #              "SENTSINCE" SP date / "SMALLER" SP number /
    #              "UID" SP sequence-set / "UNDRAFT" / sequence-set /
    #              "(" search-key *(SP search-key) ")"
    
    #sequence-set    = (seq-number / seq-range) *("," sequence-set)
    #                ; set of seq-number values, regardless of order.
    #                ; Servers MAY coalesce overlaps and/or execute the
    #                ; sequence in any order.
    #                ; Example: a message sequence number set of
    #                ; 2,4:7,9,12:* for a mailbox with 15 messages is
    #                ; equivalent to 2,4,5,6,7,9,12,13,14,15
    #                ; Example: a message sequence number set of *:4,5:7
    #                ; for a mailbox with 10 messages is equivalent to
    #                ; 10,9,8,7,6,5,4,5,6,7 and MAY be reordered and
    #                ; overlap coalesced to be 4,5,6,7,8,9,10.
    
    # With that and the information  in the first link in the documentation section you should understand everything
    # Some search keys are well explained in the second link of the documentation section of this keyword, I will complement it with the ones that need a little more.
    
    # Flag
    @{emails}  List Messages  ALL
    Log    ${emails}
    # Flag
    @{emails}  List Messages  ANSWERED
    Log    ${emails}
    # BCC <string>, You pass a String with the characters you want to search under BCC
    @{emails}  List Messages  BCC "Datos"
    Log    ${emails}
    # BEFORE <date>. YOU USE THIS TIME FORMAT FOR DATES. In caps because it was tricky
    @{emails}  List Messages  BEFORE "19-Apr-2021"
    Log    ${emails}
    # BODY <string>
    @{emails}  List Messages  BODY "Datos"
    Log    ${emails}
    #CC <string>
    @{emails}  List Messages  CC "Datos"
    Log    ${emails}
    # Flag
    @{emails}  List Messages  DELETED
    Log    ${emails}
    # Flag
    @{emails}  List Messages  DRAFT
    Log    ${emails}
    # Flag
    @{emails}  List Messages  FLAGGED
    Log    ${emails}
    # FROM <string>
    @{emails}  List Messages  FROM "Datos"
    Log    ${emails}
    # HEADER <field-name> <string>
    @{emails}  List Messages  HEADER "Datos" "Datos"
    Log    ${emails}
    # KEYWORD <flag>
    @{emails}  List Messages  KEYWORD "Datos"
    Log    ${emails}
    # LARGER <n>. I only try with 4 and worked, but I believe you just need to write a number representing the size
    @{emails}  List Messages  LARGER 4
    Log    ${emails}
    # Flag
    @{emails}  List Messages  NEW
    Log    ${emails}
    # NOT <search-key>. Actually as you can see you have to add the argument from the search key 
    @{emails}  List Messages  NOT FROM "Datos"
    Log    ${emails}
    # Flag
    @{emails}  List Messages  OLD 
    Log    ${emails}
    # ON <date>. YOU USE THIS TIME FORMAT FOR DATES
    @{emails}  List Messages  ON "19-Apr-2021"
    Log    ${emails}
    # OR <search-key1> <search-key2>. Again you need to add the respective argument from each keyword. I guess you could add more than 2 search keys
    @{emails}  List Messages  OR FROM "Google " SUBJECT "Datos"
    Log    ${emails}
    # Flag
    @{emails}  List Messages  RECENT
    Log    ${emails}
    # Flag
    @{emails}  List Messages  SEEN
    Log    ${emails}
    # SENTBEFORE <date>. YOU USE THIS TIME FORMAT FOR DATES
    @{emails}  List Messages  SENTBEFORE "19-Apr-2021"
    Log    ${emails}
    # SENTSINCE <date>. YOU USE THIS TIME FORMAT FOR DATES
    @{emails}  List Messages  SENTSINCE "19-Apr-2021"
    Log    ${emails}
    # SENTON <date>. YOU USE THIS TIME FORMAT FOR DATES
    @{emails}  List Messages  SENTON "19-Apr-2021"
    Log    ${emails}
    # SINCE <date>. YOU USE THIS TIME FORMAT FOR DATES
    @{emails}  List Messages  SINCE "19-Apr-2021"
    Log    ${emails}
    # SMALLER <n>. I only try with 1500 and worked, but I believe you just need to write a number representing the size
    @{emails}  List Messages  SMALLER 1500
    Log    ${emails}
    # SUBJECT <string>
    @{emails}  List Messages  SUBJECT "Datos"
    Log    ${emails}
    # TEXT <string>
    @{emails}  List Messages  TEXT "Datos"
    Log    ${emails}
    # TO <string>
    @{emails}  List Messages  TO "Datos"
    Log    ${emails}
    # UID <sequence set>. See the explaination for sequence-set above.
    @{emails}  List Messages  UID 2,4:7,9,12:*
    Log    ${emails}
    # Flag
    @{emails}  List Messages  UNANSWERED
    Log    ${emails} 
    # Flag
    @{emails}  List Messages  UNDELETED
    Log    ${emails}
    # Flag
    @{emails}  List Messages  UNDRAFT
    Log    ${emails}
    # Flag
    @{emails}  List Messages  UNFLAGGED
    Log    ${emails}
    # UNKEYWORD <flag>. Pass a keyword for it to ignore
    @{emails}  List Messages  UNKEYWORD SEEN
    Log    ${emails}
    # Flag
    @{emails}  List Messages  UNSEEN
    Log    ${emails}

    # Acording to the second paragrap of the section 6.4.4 of the first link in the documentation you can read:
    # When multiple keys are specified, the result is the intersection
    #  (AND function) of all the messages that match those keys.  For
    #  example, the criteria DELETED FROM "SMITH" SINCE 1-Feb-1994 refers
    #  to all deleted messages from Smith that were placed in the mailbox
    #  since February 1, 1994.  A search key can also be a parenthesized
    #  list of one or more search keys (e.g., for use with the OR and NOT
    #  keys).
    
    # From it I understand that you can just write one search key after another to do an AND operation.
    
    # This will search a mail from example@domain.com that was sent on April 30th, 2021 that has the subject Datos and that has already been seen
    @{emails}  List Messages  FROM "example@domain.com" SENTON "30-Apr-2021" SUBJECT "Datos" SEEN
    Log    ${emails}
    
    # I think you can now search "everything" you want with this. Hope it helps
    
    # Note: depending of your computer, your mail, and your search conditions it might take a while. Also remember that the mails found by every search
    # might be a lot, so it could not open if you use Robocorp Lab, but if you Download the Log you can see it without trouble in your browser.
    
    # Note 2: The idea of this is to search anything, if it does not find something it will return an empty list, the important thing is that it does not fail in the process

*** Task ***
Search IMAP
    Search Methods with IMAP
