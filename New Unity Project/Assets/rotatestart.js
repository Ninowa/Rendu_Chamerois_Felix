#pragma strict
var choices:int[] = [ 0,90, 180, 270];
var howManyThings:int = choices.length;
function Start () {

    var myRandomIndex1:int;
    myRandomIndex1 = Random.Range( 0, howManyThings );


    var result1:int;
    result1 = choices[ myRandomIndex1 ];
    
    var myRandomIndex2:int;
    myRandomIndex2 = Random.Range( 0, howManyThings );


    var result2:int;
    result2 = choices[ myRandomIndex2 ];
    
    var myRandomIndex3:int;
    myRandomIndex3 = Random.Range( 0, howManyThings );


    var result3:int;
    result3 = choices[ myRandomIndex3 ];

    transform.rotation= Quaternion.Euler(result1,result2,result3);

}

