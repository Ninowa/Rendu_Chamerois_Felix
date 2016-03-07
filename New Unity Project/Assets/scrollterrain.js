var terrain:Terrain;
private  var splatPrototypes : SplatPrototype[];
function Start () {
    splatPrototypes = terrain.terrainData.splatPrototypes;
}
 
function Update () {
 
    splatPrototypes[0].tileOffset.y+=0.5;
    //terrain.terrainData.splatPrototypes[2].tileOffset.x+=0.1;
    terrain.terrainData.splatPrototypes=splatPrototypes;
}