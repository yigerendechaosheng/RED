*** Variable ***
#comment
${var}    1  #comment
#comment

#comment
@{list}    1    2    3  #comment
#comment

#comment
&{map}    k=v  #comment
#comment

#comment
^{incorrect}    abc  #comment
#comment

#comment
${var_new}
*** Test Cases ***
test
    log  7