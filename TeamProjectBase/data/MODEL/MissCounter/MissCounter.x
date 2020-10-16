xof 0302txt 0064
template Header {
 <3D82AB43-62DA-11cf-AB39-0020AF71E433>
 WORD major;
 WORD minor;
 DWORD flags;
}

template Vector {
 <3D82AB5E-62DA-11cf-AB39-0020AF71E433>
 FLOAT x;
 FLOAT y;
 FLOAT z;
}

template Coords2d {
 <F6F23F44-7686-11cf-8F52-0040333594A3>
 FLOAT u;
 FLOAT v;
}

template Matrix4x4 {
 <F6F23F45-7686-11cf-8F52-0040333594A3>
 array FLOAT matrix[16];
}

template ColorRGBA {
 <35FF44E0-6C7C-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
}

template ColorRGB {
 <D3E16E81-7835-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
}

template IndexedColor {
 <1630B820-7842-11cf-8F52-0040333594A3>
 DWORD index;
 ColorRGBA indexColor;
}

template Boolean {
 <4885AE61-78E8-11cf-8F52-0040333594A3>
 WORD truefalse;
}

template Boolean2d {
 <4885AE63-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template MaterialWrap {
 <4885AE60-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template TextureFilename {
 <A42790E1-7810-11cf-8F52-0040333594A3>
 STRING filename;
}

template Material {
 <3D82AB4D-62DA-11cf-AB39-0020AF71E433>
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
}

template MeshFace {
 <3D82AB5F-62DA-11cf-AB39-0020AF71E433>
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
}

template MeshFaceWraps {
 <4885AE62-78E8-11cf-8F52-0040333594A3>
 DWORD nFaceWrapValues;
 Boolean2d faceWrapValues;
}

template MeshTextureCoords {
 <F6F23F40-7686-11cf-8F52-0040333594A3>
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
}

template MeshMaterialList {
 <F6F23F42-7686-11cf-8F52-0040333594A3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material]
}

template MeshNormals {
 <F6F23F43-7686-11cf-8F52-0040333594A3>
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
}

template MeshVertexColors {
 <1630B821-7842-11cf-8F52-0040333594A3>
 DWORD nVertexColors;
 array IndexedColor vertexColors[nVertexColors];
}

template Mesh {
 <3D82AB44-62DA-11cf-AB39-0020AF71E433>
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
}

Header{
1;
0;
1;
}

Mesh {
 264;
 -6.56382;-5.42923;7.37868;,
 -6.11382;-5.87923;7.37868;,
 -6.11382;-5.42923;7.82868;,
 6.26198;-5.87923;7.37868;,
 6.71198;-5.42923;7.37868;,
 6.26198;-5.42923;7.82868;,
 -6.11382;-5.87923;-7.32796;,
 -6.56382;-5.42923;-7.32796;,
 -6.11382;-5.42923;-7.77796;,
 6.71198;-5.42923;-7.32796;,
 6.26198;-5.87923;-7.32796;,
 6.26198;-5.42923;-7.77796;,
 -6.11382;5.69049;7.37868;,
 -6.56382;5.24048;7.37868;,
 -6.11382;5.24048;7.82868;,
 6.71197;5.24048;7.37868;,
 6.26197;5.69049;7.37868;,
 6.26197;5.24048;7.82868;,
 -6.56382;5.24048;-7.32796;,
 -6.11382;5.69049;-7.32796;,
 -6.11382;5.24048;-7.77796;,
 6.26197;5.69049;-7.32796;,
 6.71197;5.24048;-7.32796;,
 6.26197;5.24048;-7.77796;,
 -6.56382;-4.57461;6.53273;,
 -6.56382;-5.02461;7.37868;,
 -6.56382;-4.12461;7.37868;,
 -6.56382;-5.42923;6.08273;,
 -6.56382;-5.42923;6.98273;,
 6.71198;-4.57461;6.53273;,
 6.71198;-5.42923;6.98273;,
 6.71198;-5.42923;6.08273;,
 6.71198;-4.12461;7.37868;,
 6.71198;-5.02461;7.37868;,
 -6.56382;3.87011;7.37868;,
 -6.56382;4.77011;7.37868;,
 -6.56382;4.32011;6.53273;,
 -6.56382;5.24048;6.98273;,
 -6.56382;5.24048;6.08273;,
 6.71197;4.32011;6.53273;,
 6.71197;4.77011;7.37868;,
 6.71197;3.87011;7.37868;,
 6.71197;5.24048;6.08273;,
 6.71197;5.24048;6.98273;,
 -6.56382;-4.57461;-6.52517;,
 -6.56382;-5.42923;-6.97517;,
 -6.56382;-5.42923;-6.07517;,
 -6.56382;-4.12461;-7.32796;,
 -6.56382;-5.02461;-7.32796;,
 6.71198;-4.57461;-6.52517;,
 6.71198;-5.02461;-7.32796;,
 6.71198;-4.12461;-7.32796;,
 6.71198;-5.42923;-6.07517;,
 6.71198;-5.42923;-6.97517;,
 -6.56382;4.32011;-6.52517;,
 -6.56382;4.77011;-7.32796;,
 -6.56382;3.87011;-7.32796;,
 -6.56382;5.24048;-6.07517;,
 -6.56382;5.24048;-6.97517;,
 6.71197;3.87011;-7.32796;,
 6.71197;4.77011;-7.32796;,
 6.71197;4.32011;-6.52517;,
 6.71197;5.24048;-6.97517;,
 6.71197;5.24048;-6.07517;,
 -6.56382;4.32011;5.37822;,
 -6.56382;5.24048;5.82822;,
 -6.56382;5.24048;4.92822;,
 -6.56382;-5.42923;4.92822;,
 -6.56382;-5.42923;5.82821;,
 -6.56382;-4.57461;5.37822;,
 6.71197;5.24048;4.92822;,
 6.71197;5.24048;5.82822;,
 6.71197;4.32011;5.37822;,
 6.71198;-4.57461;5.37822;,
 6.71198;-5.42923;5.82821;,
 6.71198;-5.42923;4.92822;,
 -6.56382;5.24048;-4.88318;,
 -6.56382;5.24048;-5.78318;,
 -6.56382;4.32011;-5.33318;,
 -6.56382;-5.42923;-5.78318;,
 -6.56382;-5.42923;-4.88318;,
 -6.56382;-4.57461;-5.33318;,
 6.71197;4.32011;-5.33318;,
 6.71197;5.24048;-5.78318;,
 6.71197;5.24048;-4.88318;,
 6.71198;-4.57461;-5.33318;,
 6.71198;-5.42923;-4.88318;,
 6.71198;-5.42923;-5.78318;,
 -6.56382;-2.96261;-7.32796;,
 -6.56382;-3.86261;-7.32796;,
 -6.56382;-3.41261;-6.52517;,
 -6.56382;-3.41261;6.53273;,
 -6.56382;-3.86261;7.37868;,
 -6.56382;-2.96261;7.37868;,
 6.71198;-3.41261;-6.52517;,
 6.71198;-3.86261;-7.32796;,
 6.71198;-2.96261;-7.32796;,
 6.71198;-2.96261;7.37868;,
 6.71198;-3.86261;7.37868;,
 6.71198;-3.41261;6.53273;,
 -6.56382;3.56240;-7.32796;,
 -6.56382;2.66239;-7.32796;,
 -6.56382;3.11240;-6.52517;,
 -6.56382;2.66239;7.37868;,
 -6.56382;3.56240;7.37868;,
 -6.56382;3.11240;6.53273;,
 6.71197;3.11240;-6.52517;,
 6.71197;2.66239;-7.32796;,
 6.71197;3.56240;-7.32796;,
 6.71197;3.11240;6.53273;,
 6.71197;3.56240;7.37868;,
 6.71197;2.66239;7.37868;,
 6.71198;-3.41261;-5.33318;,
 6.71198;-3.41261;5.37822;,
 6.71197;3.11240;-5.33318;,
 6.71197;3.11240;5.37822;,
 -6.15187;-4.57461;5.37822;,
 -6.15187;-4.57461;-5.33318;,
 -6.15187;-3.41261;-5.33318;,
 -6.15187;-3.41261;5.37822;,
 -6.15187;-4.57461;-6.52517;,
 -6.15187;-3.41261;-6.52517;,
 -6.15187;-4.57461;6.53273;,
 -6.15187;-3.41261;6.53273;,
 -6.15187;4.32011;-5.33318;,
 -6.15187;4.32011;5.37822;,
 -6.15187;3.11240;-5.33318;,
 -6.15187;3.11240;5.37822;,
 -6.15187;3.11240;-6.52517;,
 -6.15187;4.32011;-6.52517;,
 -6.15187;4.32011;6.53273;,
 -6.15187;3.11240;6.53273;,
 -5.73992;-3.41261;-5.33318;,
 -5.73993;3.11240;-5.33318;,
 -5.73992;-3.41261;5.37822;,
 -5.73993;3.11240;5.37822;,
 -6.11382;-5.02461;7.82868;,
 -6.11382;-5.42923;7.82868;,
 6.26198;-5.42923;7.82868;,
 6.26198;-5.02461;7.82868;,
 -6.56382;-5.42923;7.37868;,
 6.26198;-5.87923;7.37868;,
 -6.11382;-4.12461;7.82868;,
 6.26198;-4.12461;7.82868;,
 6.71198;-5.02461;7.37868;,
 6.71198;-4.12461;7.37868;,
 6.26198;-4.12461;7.82868;,
 6.26198;-5.02461;7.82868;,
 -6.11382;-5.42923;-7.77796;,
 -6.11382;-5.02461;-7.77796;,
 6.26198;-5.02461;-7.77796;,
 6.26198;-5.42923;-7.77796;,
 6.26198;-4.12461;-7.77796;,
 -6.11382;-4.12461;-7.77796;,
 6.71198;-5.42923;-7.32796;,
 -6.11382;-5.87923;-7.32796;,
 -6.56382;-5.02461;-7.32796;,
 -6.56382;-4.12461;-7.32796;,
 -6.11382;-4.12461;-7.77796;,
 -6.11382;-5.02461;-7.77796;,
 -6.11382;5.24048;7.82868;,
 -6.11382;4.77011;7.82868;,
 6.26197;4.77011;7.82868;,
 6.26197;5.24048;7.82868;,
 6.26197;3.87011;7.82868;,
 -6.11382;3.87011;7.82868;,
 6.71197;5.24048;7.37868;,
 -6.11382;5.69049;7.37868;,
 -6.56382;4.77011;7.37868;,
 -6.56382;3.87011;7.37868;,
 -6.11382;3.87011;7.82868;,
 -6.11382;4.77011;7.82868;,
 -6.11382;4.77011;-7.77796;,
 -6.11382;5.24048;-7.77796;,
 6.26197;5.24048;-7.77796;,
 6.26197;4.77011;-7.77796;,
 -6.56382;5.24048;-7.32796;,
 6.26197;5.69049;-7.32796;,
 -6.11382;3.87011;-7.77796;,
 6.26197;3.87011;-7.77796;,
 6.71197;4.77011;-7.32796;,
 6.71197;3.87011;-7.32796;,
 6.26197;3.87011;-7.77796;,
 6.26197;4.77011;-7.77796;,
 -6.11382;-5.87923;6.98273;,
 6.26198;-5.87923;6.98273;,
 6.26198;-5.87923;6.08273;,
 -6.11382;-5.87923;6.08273;,
 -6.56382;-5.42923;6.98273;,
 -6.56382;-5.42923;6.08273;,
 -6.11382;-5.87923;6.08273;,
 -6.11382;-5.87923;6.98273;,
 -6.11382;5.69049;6.98273;,
 -6.11382;5.69049;6.98273;,
 -6.11382;5.69049;6.08273;,
 -6.56382;5.24048;6.08273;,
 -6.56382;5.24048;6.98273;,
 6.26197;5.69049;6.98273;,
 6.26197;5.69049;6.08273;,
 -6.11382;5.69049;6.08273;,
 -6.11382;-5.87923;-6.97517;,
 -6.11382;-5.87923;-6.07517;,
 -6.56382;-5.42923;-6.07517;,
 -6.56382;-5.42923;-6.97517;,
 -6.11382;-5.87923;-6.97517;,
 6.26198;-5.87923;-6.97517;,
 -6.11382;-5.87923;-6.07517;,
 6.26198;-5.87923;-6.07517;,
 6.71198;-5.42923;-6.97517;,
 6.71198;-5.42923;-6.07517;,
 6.26198;-5.87923;-6.07517;,
 6.26198;-5.87923;-6.97517;,
 -6.11382;5.69049;-6.97517;,
 -6.11382;5.69049;-6.07517;,
 6.26197;5.69049;-6.97517;,
 6.26197;5.69049;-6.07517;,
 -6.11382;5.69049;5.82822;,
 -6.11382;5.69049;5.82822;,
 -6.11382;5.69049;4.92822;,
 -6.56382;5.24048;4.92822;,
 -6.56382;5.24048;5.82822;,
 -6.11382;-5.87923;5.82821;,
 -6.11382;-5.87923;4.92822;,
 6.26197;5.69049;5.82822;,
 -6.11382;5.69049;4.92822;,
 6.26197;5.69049;4.92822;,
 6.71197;5.24048;5.82822;,
 6.71197;5.24048;4.92822;,
 6.26197;5.69049;4.92822;,
 6.26197;5.69049;5.82822;,
 6.26198;-5.87923;5.82821;,
 6.26198;-5.87923;4.92822;,
 -6.11382;5.69049;-5.78318;,
 -6.11382;5.69049;-4.88318;,
 6.26197;5.69049;-5.78318;,
 6.26197;5.69049;-4.88318;,
 -6.11382;-5.87923;-4.88318;,
 -6.11382;-5.87923;-5.78318;,
 6.26198;-5.87923;-4.88318;,
 6.26198;-5.87923;-5.78318;,
 -6.11382;-3.86261;-7.77796;,
 -6.11382;-2.96261;-7.77796;,
 -6.11382;-3.86261;7.82868;,
 -6.11382;-3.86261;7.82868;,
 -6.11382;-2.96261;7.82868;,
 -6.56382;-2.96261;7.37868;,
 -6.56382;-3.86261;7.37868;,
 6.26198;-3.86261;-7.77796;,
 6.26198;-2.96261;-7.77796;,
 6.26198;-3.86261;7.82868;,
 -6.11382;-2.96261;7.82868;,
 6.26198;-2.96261;7.82868;,
 6.71198;-3.86261;7.37868;,
 6.71198;-2.96261;7.37868;,
 6.26198;-2.96261;7.82868;,
 6.26198;-3.86261;7.82868;,
 -6.11382;2.66239;-7.77796;,
 -6.11382;3.56240;-7.77796;,
 -6.11382;3.56240;7.82868;,
 -6.11382;2.66239;7.82868;,
 6.26197;2.66239;-7.77796;,
 6.26197;3.56240;-7.77796;,
 6.26197;3.56240;7.82868;,
 6.26197;2.66239;7.82868;;
 
 396;
 3;0,1,2;,
 3;3,4,5;,
 3;6,7,8;,
 3;9,10,11;,
 3;12,13,14;,
 3;15,16,17;,
 3;18,19,20;,
 3;21,22,23;,
 3;24,25,26;,
 3;27,28,24;,
 3;29,30,31;,
 3;32,33,29;,
 3;34,35,36;,
 3;36,37,38;,
 3;39,40,41;,
 3;42,43,39;,
 3;44,45,46;,
 3;47,48,44;,
 3;49,50,51;,
 3;52,53,49;,
 3;54,55,56;,
 3;57,58,54;,
 3;59,60,61;,
 3;61,62,63;,
 3;64,65,66;,
 3;67,68,69;,
 3;70,71,72;,
 3;73,74,75;,
 3;76,77,78;,
 3;79,80,81;,
 3;82,83,84;,
 3;85,86,87;,
 3;88,89,90;,
 3;91,92,93;,
 3;94,95,96;,
 3;97,98,99;,
 3;100,101,102;,
 3;103,104,105;,
 3;106,107,108;,
 3;109,110,111;,
 3;49,94,112;,
 3;49,112,85;,
 3;99,29,73;,
 3;99,73,113;,
 3;85,112,113;,
 3;85,113,73;,
 3;94,106,114;,
 3;94,114,112;,
 3;106,61,82;,
 3;106,82,114;,
 3;39,109,115;,
 3;39,115,72;,
 3;109,99,113;,
 3;109,113,115;,
 3;112,114,115;,
 3;112,115,113;,
 3;114,82,72;,
 3;114,72,115;,
 3;116,117,81;,
 3;116,81,69;,
 3;118,117,116;,
 3;118,116,119;,
 3;120,121,90;,
 3;120,90,44;,
 3;117,120,44;,
 3;117,44,81;,
 3;117,118,121;,
 3;117,121,120;,
 3;122,116,69;,
 3;122,69,24;,
 3;123,122,24;,
 3;123,24,91;,
 3;119,116,122;,
 3;119,122,123;,
 3;124,125,64;,
 3;124,64,78;,
 3;124,126,127;,
 3;124,127,125;,
 3;121,128,102;,
 3;121,102,90;,
 3;118,126,128;,
 3;118,128,121;,
 3;129,124,78;,
 3;129,78,54;,
 3;128,129,54;,
 3;128,54,102;,
 3;124,129,128;,
 3;124,128,126;,
 3;130,131,105;,
 3;130,105,36;,
 3;125,130,36;,
 3;125,36,64;,
 3;125,127,131;,
 3;125,131,130;,
 3;123,91,105;,
 3;123,105,131;,
 3;127,119,123;,
 3;127,123,131;,
 3;132,133,126;,
 3;132,126,118;,
 3;134,132,118;,
 3;134,118,119;,
 3;134,119,127;,
 3;134,127,135;,
 3;133,135,127;,
 3;133,127,126;,
 3;133,132,134;,
 3;133,134,135;,
 3;136,137,138;,
 3;136,138,139;,
 3;137,136,25;,
 3;137,25,140;,
 3;141,138,137;,
 3;141,137,1;,
 3;33,139,138;,
 3;33,138,4;,
 3;142,136,139;,
 3;142,139,143;,
 3;142,26,25;,
 3;142,25,136;,
 3;144,145,146;,
 3;144,146,147;,
 3;148,149,150;,
 3;148,150,151;,
 3;48,149,148;,
 3;48,148,7;,
 3;152,150,149;,
 3;152,149,153;,
 3;154,151,150;,
 3;154,150,50;,
 3;155,148,151;,
 3;155,151,10;,
 3;156,157,158;,
 3;156,158,159;,
 3;152,51,50;,
 3;152,50,150;,
 3;160,161,162;,
 3;160,162,163;,
 3;35,161,160;,
 3;35,160,13;,
 3;164,162,161;,
 3;164,161,165;,
 3;166,163,162;,
 3;166,162,40;,
 3;167,160,163;,
 3;167,163,16;,
 3;168,169,170;,
 3;168,170,171;,
 3;164,41,40;,
 3;164,40,162;,
 3;172,173,174;,
 3;172,174,175;,
 3;176,173,172;,
 3;176,172,55;,
 3;177,174,173;,
 3;177,173,19;,
 3;60,175,174;,
 3;60,174,22;,
 3;178,172,175;,
 3;178,175,179;,
 3;178,56,55;,
 3;178,55,172;,
 3;180,181,182;,
 3;180,182,183;,
 3;1,184,185;,
 3;1,185,141;,
 3;28,184,1;,
 3;28,1,140;,
 3;186,185,184;,
 3;186,184,187;,
 3;4,141,185;,
 3;4,185,30;,
 3;188,189,190;,
 3;188,190,191;,
 3;186,31,30;,
 3;186,30,185;,
 3;28,140,25;,
 3;28,25,24;,
 3;30,29,33;,
 3;30,33,4;,
 3;35,13,37;,
 3;35,37,36;,
 3;192,37,13;,
 3;192,13,167;,
 3;193,194,195;,
 3;193,195,196;,
 3;40,39,43;,
 3;40,43,166;,
 3;16,166,43;,
 3;16,43,197;,
 3;42,198,197;,
 3;42,197,43;,
 3;192,167,16;,
 3;192,16,197;,
 3;199,192,197;,
 3;199,197,198;,
 3;45,44,48;,
 3;45,48,7;,
 3;200,45,7;,
 3;200,7,155;,
 3;201,202,203;,
 3;201,203,204;,
 3;200,155,10;,
 3;200,10,205;,
 3;53,205,10;,
 3;53,10,154;,
 3;206,200,205;,
 3;206,205,207;,
 3;208,209,210;,
 3;208,210,211;,
 3;53,154,50;,
 3;53,50,49;,
 3;55,54,58;,
 3;55,58,176;,
 3;19,176,58;,
 3;19,58,212;,
 3;57,213,212;,
 3;57,212,58;,
 3;19,212,214;,
 3;19,214,177;,
 3;215,214,212;,
 3;215,212,213;,
 3;22,177,214;,
 3;22,214,62;,
 3;215,63,62;,
 3;215,62,214;,
 3;60,22,62;,
 3;60,62,61;,
 3;64,36,38;,
 3;64,38,65;,
 3;216,65,38;,
 3;216,38,199;,
 3;217,218,219;,
 3;217,219,220;,
 3;24,69,68;,
 3;24,68,27;,
 3;187,27,68;,
 3;187,68,221;,
 3;67,222,221;,
 3;67,221,68;,
 3;216,199,198;,
 3;216,198,223;,
 3;71,223,198;,
 3;71,198,42;,
 3;224,216,223;,
 3;224,223,225;,
 3;226,227,228;,
 3;226,228,229;,
 3;187,221,230;,
 3;187,230,186;,
 3;231,230,221;,
 3;231,221,222;,
 3;186,230,74;,
 3;186,74,31;,
 3;75,74,230;,
 3;75,230,231;,
 3;71,42,39;,
 3;71,39,72;,
 3;31,74,73;,
 3;31,73,29;,
 3;54,78,77;,
 3;54,77,57;,
 3;213,57,77;,
 3;213,77,232;,
 3;76,233,232;,
 3;76,232,77;,
 3;78,64,66;,
 3;78,66,76;,
 3;233,76,66;,
 3;233,66,224;,
 3;213,232,234;,
 3;213,234,215;,
 3;235,234,232;,
 3;235,232,233;,
 3;63,215,234;,
 3;63,234,83;,
 3;235,84,83;,
 3;235,83,234;,
 3;233,224,225;,
 3;233,225,235;,
 3;84,235,225;,
 3;84,225,70;,
 3;69,81,80;,
 3;69,80,67;,
 3;222,67,80;,
 3;222,80,236;,
 3;79,237,236;,
 3;79,236,80;,
 3;81,44,46;,
 3;81,46,79;,
 3;237,79,46;,
 3;237,46,206;,
 3;63,83,82;,
 3;63,82,61;,
 3;84,70,72;,
 3;84,72,82;,
 3;222,236,238;,
 3;222,238,231;,
 3;239,238,236;,
 3;239,236,237;,
 3;75,231,238;,
 3;75,238,86;,
 3;239,87,86;,
 3;239,86,238;,
 3;237,206,207;,
 3;237,207,239;,
 3;87,239,207;,
 3;87,207,52;,
 3;75,86,85;,
 3;75,85,73;,
 3;87,52,49;,
 3;87,49,85;,
 3;44,90,89;,
 3;44,89,47;,
 3;153,47,89;,
 3;153,89,240;,
 3;88,241,240;,
 3;88,240,89;,
 3;91,24,26;,
 3;91,26,92;,
 3;242,92,26;,
 3;242,26,142;,
 3;243,244,245;,
 3;243,245,246;,
 3;153,240,247;,
 3;153,247,152;,
 3;248,247,240;,
 3;248,240,241;,
 3;51,152,247;,
 3;51,247,95;,
 3;248,96,95;,
 3;248,95,247;,
 3;242,142,143;,
 3;242,143,249;,
 3;98,249,143;,
 3;98,143,32;,
 3;250,242,249;,
 3;250,249,251;,
 3;252,253,254;,
 3;252,254,255;,
 3;51,95,94;,
 3;51,94,49;,
 3;98,32,29;,
 3;98,29,99;,
 3;90,102,101;,
 3;90,101,88;,
 3;241,88,101;,
 3;241,101,256;,
 3;100,257,256;,
 3;100,256,101;,
 3;54,56,100;,
 3;54,100,102;,
 3;257,100,56;,
 3;257,56,178;,
 3;36,105,104;,
 3;36,104,34;,
 3;165,34,104;,
 3;165,104,258;,
 3;103,259,258;,
 3;103,258,104;,
 3;105,91,93;,
 3;105,93,103;,
 3;259,103,93;,
 3;259,93,250;,
 3;241,256,260;,
 3;241,260,248;,
 3;261,260,256;,
 3;261,256,257;,
 3;96,248,260;,
 3;96,260,107;,
 3;261,108,107;,
 3;261,107,260;,
 3;257,178,179;,
 3;257,179,261;,
 3;108,261,179;,
 3;108,179,59;,
 3;165,258,262;,
 3;165,262,164;,
 3;263,262,258;,
 3;263,258,259;,
 3;41,164,262;,
 3;41,262,110;,
 3;263,111,110;,
 3;263,110,262;,
 3;259,250,251;,
 3;259,251,263;,
 3;111,263,251;,
 3;111,251,97;,
 3;96,107,106;,
 3;96,106,94;,
 3;108,59,61;,
 3;108,61,106;,
 3;41,110,109;,
 3;41,109,39;,
 3;111,97,99;,
 3;111,99,109;;
 
 MeshMaterialList {
  2;
  396;
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  1,
  1,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0;;
  Material {
   0.343137;0.382353;0.435294;1.000000;;
   3.750000;
   0.350000;0.350000;0.350000;;
   0.137255;0.152941;0.174118;;
  }
  Material {
   0.000000;0.000000;0.000000;1.000000;;
   3.750000;
   0.050000;0.050000;0.050000;;
   0.000000;0.000000;0.000000;;
  }
 }
 MeshNormals {
  190;
  -0.875579;-0.341585;0.341587;,
  -0.341587;-0.875580;0.341581;,
  -0.341584;-0.341589;0.875578;,
  0.341572;-0.875584;0.341587;,
  0.875578;-0.341590;0.341584;,
  0.341586;-0.341578;0.875582;,
  -0.341582;-0.875578;-0.341593;,
  -0.875579;-0.341589;-0.341584;,
  -0.341578;-0.341590;-0.875580;,
  0.875578;-0.341583;-0.341590;,
  0.341586;-0.875581;-0.341580;,
  0.341581;-0.341593;-0.875578;,
  -0.341583;0.875575;0.341597;,
  -0.875579;0.341587;0.341584;,
  -0.341587;0.341573;0.875583;,
  0.875578;0.341579;0.341594;,
  0.341588;0.875579;0.341583;,
  0.341580;0.341589;0.875580;,
  -0.875580;0.341578;-0.341592;,
  -0.341589;0.875579;-0.341582;,
  -0.341582;0.341590;-0.875579;,
  0.341583;0.875576;-0.341596;,
  0.875579;0.341587;-0.341584;,
  0.341588;0.341575;-0.875582;,
  -1.000000;0.000000;0.000000;,
  -0.923878;0.000000;0.382686;,
  -0.923879;0.000000;0.382685;,
  -0.923883;-0.382674;-0.000000;,
  -0.923879;-0.382685;-0.000000;,
  1.000000;0.000000;0.000000;,
  0.923880;-0.382682;0.000001;,
  0.923881;-0.382680;0.000001;,
  0.923882;0.000000;0.382677;,
  0.923878;0.000000;0.382686;,
  -0.923883;0.000000;0.382676;,
  -0.923879;0.000000;0.382684;,
  -0.923882;0.382677;0.000000;,
  -0.923879;0.382685;0.000000;,
  1.000000;0.000000;0.000000;,
  0.923881;0.000000;0.382680;,
  0.923879;0.000000;0.382684;,
  0.923882;0.382676;0.000000;,
  0.923880;0.382682;0.000000;,
  -0.923879;-0.382684;-0.000000;,
  -0.923880;-0.382682;-0.000000;,
  -0.923883;0.000000;-0.382675;,
  -0.923880;0.000000;-0.382682;,
  0.923882;0.000000;-0.382678;,
  0.923880;0.000000;-0.382682;,
  0.923883;-0.382675;0.000000;,
  0.923878;-0.382687;0.000000;,
  -0.923883;0.000000;-0.382676;,
  -0.923882;0.000000;-0.382677;,
  -0.923883;0.382675;0.000000;,
  -0.923881;0.382681;0.000000;,
  0.923883;0.000000;-0.382675;,
  0.923880;0.000000;-0.382681;,
  0.923879;0.382684;0.000000;,
  0.923881;0.382681;0.000000;,
  -0.923885;0.382671;0.000000;,
  -0.923880;0.382683;0.000000;,
  -0.923882;-0.382678;-0.000000;,
  -0.923880;-0.382683;-0.000000;,
  0.923884;0.382672;0.000000;,
  0.923879;0.382686;0.000000;,
  1.000000;0.000001;0.000000;,
  0.923882;-0.382677;0.000000;,
  0.923879;-0.382685;-0.000000;,
  -0.923883;0.382675;0.000000;,
  -0.923881;0.382680;0.000000;,
  -0.923882;-0.382679;-0.000000;,
  -0.923880;-0.382681;-0.000000;,
  -1.000000;0.000000;0.000000;,
  0.923882;0.382676;0.000000;,
  0.923881;0.382680;0.000000;,
  1.000000;0.000000;-0.000000;,
  0.923878;-0.382687;-0.000000;,
  0.923880;-0.382682;0.000000;,
  -0.923878;-0.000000;-0.382688;,
  -0.923880;0.000000;-0.382682;,
  -1.000000;-0.000000;-0.000000;,
  -1.000000;-0.000000;0.000000;,
  -0.923882;0.000000;0.382677;,
  -0.923877;-0.000000;0.382690;,
  1.000000;0.000000;0.000000;,
  0.923881;0.000000;-0.382679;,
  0.923880;0.000000;-0.382683;,
  0.923882;0.000000;0.382676;,
  0.923877;0.000000;0.382689;,
  1.000000;0.000000;-0.000000;,
  -0.923880;0.000000;-0.382682;,
  -0.923880;-0.000000;-0.382683;,
  -1.000000;-0.000000;0.000000;,
  -0.923881;-0.000000;0.382680;,
  -0.923880;0.000000;0.382683;,
  -1.000000;-0.000000;-0.000000;,
  1.000000;0.000000;-0.000000;,
  0.923878;0.000000;-0.382688;,
  0.923881;0.000000;-0.382681;,
  1.000000;0.000000;0.000000;,
  0.923881;0.000000;0.382681;,
  0.923878;0.000000;0.382686;,
  1.000000;0.000000;0.000000;,
  1.000000;0.000000;0.000000;,
  1.000000;0.000000;0.000000;,
  1.000000;0.000000;0.000000;,
  0.000000;1.000000;0.000000;,
  -1.000000;-0.000000;-0.000000;,
  -1.000000;-0.000000;-0.000000;,
  0.000000;0.000000;1.000000;,
  0.000000;-0.000000;1.000000;,
  0.000000;-0.000000;1.000000;,
  0.000000;0.000000;1.000000;,
  0.000000;1.000000;0.000000;,
  -1.000000;-0.000000;-0.000000;,
  0.000000;0.000000;-1.000000;,
  0.000000;0.000000;-1.000000;,
  -1.000000;-0.000000;-0.000000;,
  0.000000;-1.000000;0.000000;,
  -1.000000;-0.000000;-0.000000;,
  -1.000000;-0.000000;-0.000000;,
  0.000000;0.000001;1.000000;,
  0.000000;0.000001;1.000000;,
  -1.000000;-0.000000;-0.000000;,
  0.000000;-1.000000;0.000000;,
  0.000000;0.000003;1.000000;,
  0.000000;0.000003;1.000000;,
  -1.000000;-0.000000;-0.000000;,
  -1.000000;-0.000001;-0.000000;,
  -0.382678;0.000000;0.923882;,
  0.382675;0.000000;0.923883;,
  -0.382679;0.000000;0.923881;,
  0.382686;0.000000;0.923879;,
  -0.382677;0.000000;-0.923882;,
  0.382683;0.000000;-0.923880;,
  0.382681;0.000000;-0.923880;,
  -0.382687;0.000000;-0.923878;,
  -0.382676;0.000000;0.923883;,
  0.382682;0.000000;0.923880;,
  0.382679;0.000000;0.923881;,
  -0.382686;0.000000;0.923879;,
  -0.382684;0.000000;-0.923879;,
  0.382677;0.000000;-0.923882;,
  -0.382682;0.000000;-0.923880;,
  0.382686;0.000000;-0.923878;,
  -0.382678;-0.923882;-0.000000;,
  0.382675;-0.923883;0.000000;,
  0.382684;-0.923879;0.000000;,
  -0.382688;-0.923878;-0.000000;,
  -0.382691;0.923876;0.000000;,
  -0.382681;0.923881;0.000000;,
  0.382684;0.923879;0.000000;,
  0.382686;0.923878;0.000000;,
  -0.382683;-0.923880;-0.000000;,
  -0.382682;-0.923880;-0.000000;,
  0.382677;-0.923882;0.000000;,
  0.382687;-0.923878;0.000000;,
  -0.382685;0.923879;0.000000;,
  -0.382687;0.923878;0.000000;,
  0.382685;0.923879;0.000000;,
  0.382684;0.923879;0.000000;,
  -0.382691;0.923876;0.000000;,
  -0.382681;0.923881;0.000000;,
  -0.382686;-0.923879;-0.000000;,
  0.382680;0.923881;0.000000;,
  0.382692;0.923876;0.000000;,
  0.382685;-0.923879;0.000000;,
  0.382685;-0.923879;-0.000000;,
  -0.382689;0.923877;0.000000;,
  0.382686;0.923879;0.000000;,
  -0.382682;-0.923880;-0.000000;,
  -0.382683;-0.923880;-0.000000;,
  0.382685;-0.923879;-0.000000;,
  0.382681;-0.923880;0.000000;,
  -0.382681;0.000000;-0.923881;,
  -0.382689;-0.000000;-0.923877;,
  -0.382686;0.000000;0.923879;,
  -0.382667;-0.000000;0.923886;,
  0.382683;0.000000;-0.923880;,
  0.382689;0.000000;-0.923877;,
  0.382675;0.000000;0.923883;,
  0.382692;0.000000;0.923876;,
  -0.382690;-0.000000;-0.923877;,
  -0.382683;0.000000;-0.923880;,
  -0.382680;0.000000;0.923881;,
  -0.382688;-0.000000;0.923878;,
  0.382689;0.000000;-0.923877;,
  0.382681;0.000000;-0.923881;,
  0.382681;0.000000;0.923881;,
  0.382671;0.000000;0.923885;;
  396;
  3;0,1,2;,
  3;3,4,5;,
  3;6,7,8;,
  3;9,10,11;,
  3;12,13,14;,
  3;15,16,17;,
  3;18,19,20;,
  3;21,22,23;,
  3;24,25,26;,
  3;27,28,24;,
  3;29,30,31;,
  3;32,33,29;,
  3;34,35,24;,
  3;24,36,37;,
  3;38,39,40;,
  3;41,42,38;,
  3;24,43,44;,
  3;45,46,24;,
  3;38,47,48;,
  3;49,50,38;,
  3;24,51,52;,
  3;53,54,24;,
  3;55,56,38;,
  3;38,57,58;,
  3;24,59,60;,
  3;61,62,24;,
  3;63,64,38;,
  3;65,66,67;,
  3;68,69,24;,
  3;70,71,72;,
  3;38,73,74;,
  3;75,76,77;,
  3;78,79,80;,
  3;81,82,83;,
  3;84,85,86;,
  3;87,88,89;,
  3;90,91,92;,
  3;93,94,95;,
  3;96,97,98;,
  3;99,100,101;,
  3;38,84,102;,
  3;38,102,75;,
  3;89,29,65;,
  3;89,65,103;,
  3;75,102,103;,
  3;75,103,65;,
  3;84,96,104;,
  3;84,104,102;,
  3;96,38,38;,
  3;96,38,104;,
  3;38,99,105;,
  3;38,105,38;,
  3;99,89,103;,
  3;99,103,105;,
  3;102,104,105;,
  3;102,105,103;,
  3;104,38,38;,
  3;104,38,105;,
  3;106,106,106;,
  3;106,106,106;,
  3;107,72,72;,
  3;107,72,108;,
  3;109,110,111;,
  3;109,111,112;,
  3;106,106,113;,
  3;106,113,106;,
  3;72,107,114;,
  3;72,114,24;,
  3;106,106,106;,
  3;106,106,106;,
  3;115,115,116;,
  3;115,116,116;,
  3;108,72,24;,
  3;108,24,117;,
  3;118,118,118;,
  3;118,118,118;,
  3;24,119,120;,
  3;24,120,24;,
  3;110,121,122;,
  3;110,122,111;,
  3;107,119,123;,
  3;107,123,114;,
  3;124,118,118;,
  3;124,118,118;,
  3;121,125,126;,
  3;121,126,122;,
  3;24,24,123;,
  3;24,123,119;,
  3;116,116,115;,
  3;116,115,115;,
  3;118,118,118;,
  3;118,118,118;,
  3;24,120,127;,
  3;24,127,24;,
  3;115,116,115;,
  3;115,115,116;,
  3;120,108,117;,
  3;120,117,127;,
  3;112,112,112;,
  3;112,112,109;,
  3;106,106,106;,
  3;106,106,106;,
  3;115,116,115;,
  3;115,115,115;,
  3;118,118,118;,
  3;118,118,118;,
  3;128,128,128;,
  3;128,128,128;,
  3;129,2,5;,
  3;129,5,130;,
  3;2,129,25;,
  3;2,25,0;,
  3;3,5,2;,
  3;3,2,1;,
  3;33,130,5;,
  3;33,5,4;,
  3;131,129,130;,
  3;131,130,132;,
  3;131,26,25;,
  3;131,25,129;,
  3;33,32,132;,
  3;33,132,130;,
  3;8,133,134;,
  3;8,134,11;,
  3;46,133,8;,
  3;46,8,7;,
  3;135,134,133;,
  3;135,133,136;,
  3;9,11,134;,
  3;9,134,47;,
  3;6,8,11;,
  3;6,11,10;,
  3;46,45,136;,
  3;46,136,133;,
  3;135,48,47;,
  3;135,47,134;,
  3;14,137,138;,
  3;14,138,17;,
  3;35,137,14;,
  3;35,14,13;,
  3;139,138,137;,
  3;139,137,140;,
  3;15,17,138;,
  3;15,138,39;,
  3;12,14,17;,
  3;12,17,16;,
  3;35,34,140;,
  3;35,140,137;,
  3;139,40,39;,
  3;139,39,138;,
  3;141,20,23;,
  3;141,23,142;,
  3;18,20,141;,
  3;18,141,51;,
  3;21,23,20;,
  3;21,20,19;,
  3;56,142,23;,
  3;56,23,22;,
  3;143,141,142;,
  3;143,142,144;,
  3;143,52,51;,
  3;143,51,141;,
  3;56,55,144;,
  3;56,144,142;,
  3;1,145,146;,
  3;1,146,3;,
  3;28,145,1;,
  3;28,1,0;,
  3;147,146,145;,
  3;147,145,148;,
  3;4,3,146;,
  3;4,146,30;,
  3;28,27,148;,
  3;28,148,145;,
  3;147,31,30;,
  3;147,30,146;,
  3;28,0,25;,
  3;28,25,24;,
  3;30,29,33;,
  3;30,33,4;,
  3;35,13,36;,
  3;35,36,24;,
  3;149,36,13;,
  3;149,13,12;,
  3;149,150,37;,
  3;149,37,36;,
  3;39,38,42;,
  3;39,42,15;,
  3;16,15,42;,
  3;16,42,151;,
  3;41,152,151;,
  3;41,151,42;,
  3;149,12,16;,
  3;149,16,151;,
  3;150,149,151;,
  3;150,151,152;,
  3;43,24,46;,
  3;43,46,7;,
  3;153,43,7;,
  3;153,7,6;,
  3;154,44,43;,
  3;154,43,153;,
  3;153,6,10;,
  3;153,10,155;,
  3;50,155,10;,
  3;50,10,9;,
  3;154,153,155;,
  3;154,155,156;,
  3;50,49,156;,
  3;50,156,155;,
  3;50,9,47;,
  3;50,47,38;,
  3;51,24,54;,
  3;51,54,18;,
  3;19,18,54;,
  3;19,54,157;,
  3;53,158,157;,
  3;53,157,54;,
  3;19,157,159;,
  3;19,159,21;,
  3;160,159,157;,
  3;160,157,158;,
  3;22,21,159;,
  3;22,159,57;,
  3;160,58,57;,
  3;160,57,159;,
  3;56,22,57;,
  3;56,57,38;,
  3;24,24,37;,
  3;24,37,59;,
  3;161,59,37;,
  3;161,37,150;,
  3;161,162,60;,
  3;161,60,59;,
  3;24,24,62;,
  3;24,62,27;,
  3;148,27,62;,
  3;148,62,154;,
  3;61,163,154;,
  3;61,154,62;,
  3;161,150,152;,
  3;161,152,164;,
  3;64,164,152;,
  3;64,152,41;,
  3;162,161,164;,
  3;162,164,165;,
  3;64,63,165;,
  3;64,165,164;,
  3;148,154,166;,
  3;148,166,147;,
  3;167,166,154;,
  3;167,154,163;,
  3;147,166,66;,
  3;147,66,31;,
  3;67,66,166;,
  3;67,166,167;,
  3;64,41,38;,
  3;64,38,38;,
  3;31,66,65;,
  3;31,65,29;,
  3;24,24,69;,
  3;24,69,53;,
  3;158,53,69;,
  3;158,69,157;,
  3;68,168,157;,
  3;68,157,69;,
  3;24,24,60;,
  3;24,60,68;,
  3;168,68,60;,
  3;168,60,162;,
  3;158,157,169;,
  3;158,169,160;,
  3;160,169,157;,
  3;160,157,168;,
  3;58,160,169;,
  3;58,169,73;,
  3;160,74,73;,
  3;160,73,169;,
  3;168,162,165;,
  3;168,165,160;,
  3;74,160,165;,
  3;74,165,63;,
  3;24,72,71;,
  3;24,71,61;,
  3;163,61,71;,
  3;163,71,170;,
  3;70,171,170;,
  3;70,170,71;,
  3;72,24,44;,
  3;72,44,70;,
  3;171,70,44;,
  3;171,44,154;,
  3;58,73,38;,
  3;58,38,38;,
  3;74,63,38;,
  3;74,38,38;,
  3;163,170,172;,
  3;163,172,167;,
  3;173,172,170;,
  3;173,170,171;,
  3;67,167,172;,
  3;67,172,76;,
  3;173,77,76;,
  3;173,76,172;,
  3;171,154,156;,
  3;171,156,173;,
  3;77,173,156;,
  3;77,156,49;,
  3;67,76,75;,
  3;67,75,65;,
  3;77,49,38;,
  3;77,38,75;,
  3;24,80,79;,
  3;24,79,45;,
  3;136,45,79;,
  3;136,79,174;,
  3;78,175,174;,
  3;78,174,79;,
  3;81,24,26;,
  3;81,26,82;,
  3;176,82,26;,
  3;176,26,131;,
  3;176,177,83;,
  3;176,83,82;,
  3;136,174,178;,
  3;136,178,135;,
  3;179,178,174;,
  3;179,174,175;,
  3;48,135,178;,
  3;48,178,85;,
  3;179,86,85;,
  3;179,85,178;,
  3;176,131,132;,
  3;176,132,180;,
  3;88,180,132;,
  3;88,132,32;,
  3;177,176,180;,
  3;177,180,181;,
  3;88,87,181;,
  3;88,181,180;,
  3;48,85,84;,
  3;48,84,38;,
  3;88,32,29;,
  3;88,29,89;,
  3;80,92,91;,
  3;80,91,78;,
  3;175,78,91;,
  3;175,91,182;,
  3;90,183,182;,
  3;90,182,91;,
  3;24,52,90;,
  3;24,90,92;,
  3;183,90,52;,
  3;183,52,143;,
  3;24,95,94;,
  3;24,94,34;,
  3;140,34,94;,
  3;140,94,184;,
  3;93,185,184;,
  3;93,184,94;,
  3;95,81,83;,
  3;95,83,93;,
  3;185,93,83;,
  3;185,83,177;,
  3;175,182,186;,
  3;175,186,179;,
  3;187,186,182;,
  3;187,182,183;,
  3;86,179,186;,
  3;86,186,97;,
  3;187,98,97;,
  3;187,97,186;,
  3;183,143,144;,
  3;183,144,187;,
  3;98,187,144;,
  3;98,144,55;,
  3;140,184,188;,
  3;140,188,139;,
  3;189,188,184;,
  3;189,184,185;,
  3;40,139,188;,
  3;40,188,100;,
  3;189,101,100;,
  3;189,100,188;,
  3;185,177,181;,
  3;185,181,189;,
  3;101,189,181;,
  3;101,181,87;,
  3;86,97,96;,
  3;86,96,84;,
  3;98,55,38;,
  3;98,38,96;,
  3;40,100,99;,
  3;40,99,38;,
  3;101,87,89;,
  3;101,89,99;;
 }
 MeshTextureCoords {
  264;
  1.022500;0.022500;,
  0.022500;0.044697;,
  -0.022500;0.044697;,
  1.022500;0.955303;,
  0.022500;0.977500;,
  -0.022500;0.955303;,
  -0.022500;0.044697;,
  0.022500;0.977500;,
  1.022500;0.044697;,
  0.022500;1.022500;,
  0.977500;0.955303;,
  0.022500;-0.044697;,
  -0.022500;0.044697;,
  0.977500;0.022500;,
  1.022500;0.044697;,
  -0.022500;0.977500;,
  0.977500;0.955303;,
  1.022500;0.955303;,
  0.977500;-0.022500;,
  0.022500;0.044697;,
  0.977500;1.044697;,
  1.022500;0.955303;,
  0.977500;0.022500;,
  -0.022500;0.955303;,
  0.065231;0.064797;,
  0.042731;0.022500;,
  0.087731;0.022500;,
  0.022500;0.087297;,
  0.022500;0.042298;,
  0.065231;0.935202;,
  0.022500;0.957703;,
  0.022500;0.912703;,
  0.087731;0.977500;,
  0.042731;0.977500;,
  0.908981;0.022500;,
  0.953981;0.022500;,
  0.931481;0.064797;,
  0.977500;0.042298;,
  0.977500;0.087297;,
  0.931481;0.935202;,
  0.953981;0.977500;,
  0.908981;0.977500;,
  0.977500;0.912703;,
  0.977500;0.957703;,
  0.065231;0.937360;,
  0.022500;0.959860;,
  0.022500;0.914860;,
  0.087731;0.977500;,
  0.042731;0.977500;,
  0.065231;0.062640;,
  0.042731;0.022500;,
  0.087731;0.022500;,
  0.022500;0.085140;,
  0.022500;0.040140;,
  0.931481;0.937360;,
  0.953981;0.977500;,
  0.908981;0.977500;,
  0.977500;0.914860;,
  0.977500;0.959860;,
  0.908981;0.022500;,
  0.953981;0.022500;,
  0.931481;0.062640;,
  0.977500;0.040140;,
  0.977500;0.085140;,
  0.931481;0.122523;,
  0.977500;0.100023;,
  0.977500;0.135108;,
  0.022500;0.135108;,
  0.022500;0.100023;,
  0.065231;0.122523;,
  0.977500;0.864892;,
  0.977500;0.899977;,
  0.931481;0.877477;,
  0.065231;0.877477;,
  0.022500;0.899977;,
  0.022500;0.864892;,
  0.977500;0.865176;,
  0.977500;0.900261;,
  0.931481;0.877761;,
  0.022500;0.900261;,
  0.022500;0.865176;,
  0.065231;0.877761;,
  0.931481;0.122239;,
  0.977500;0.099739;,
  0.977500;0.134824;,
  0.065231;0.122239;,
  0.022500;0.134824;,
  0.022500;0.099739;,
  0.145831;0.977500;,
  0.100831;0.977500;,
  0.123331;0.937360;,
  0.123331;0.064797;,
  0.100831;0.022500;,
  0.145831;0.022500;,
  0.123331;0.062640;,
  0.100831;0.022500;,
  0.145831;0.022500;,
  0.145831;0.977500;,
  0.100831;0.977500;,
  0.123331;0.935202;,
  0.893596;0.977500;,
  0.848596;0.977500;,
  0.871096;0.937360;,
  0.848596;0.022500;,
  0.893596;0.022500;,
  0.871096;0.064797;,
  0.871096;0.062640;,
  0.848596;0.022500;,
  0.893596;0.022500;,
  0.871096;0.935202;,
  0.893596;0.977500;,
  0.848596;0.977500;,
  0.123331;0.122239;,
  0.123331;0.877477;,
  0.871096;0.122239;,
  0.871096;0.877477;,
  0.065231;0.122523;,
  0.065231;0.877761;,
  0.123331;0.877761;,
  0.123331;0.122523;,
  0.065231;0.937360;,
  0.123331;0.937360;,
  0.065231;0.064797;,
  0.123331;0.064797;,
  0.931481;0.877761;,
  0.931481;0.122523;,
  0.871096;0.877761;,
  0.871096;0.122523;,
  0.871096;0.937360;,
  0.931481;0.937360;,
  0.931481;0.064797;,
  0.871096;0.064797;,
  0.123331;0.877761;,
  0.871096;0.877761;,
  0.123331;0.122523;,
  0.871096;0.122523;,
  0.957269;0.044697;,
  0.977500;0.044697;,
  0.977500;0.955303;,
  0.957269;0.955303;,
  0.022500;0.022500;,
  0.022500;0.955303;,
  0.912269;0.044697;,
  0.912269;0.955303;,
  0.912269;0.977500;,
  0.957269;0.977500;,
  0.042731;0.955303;,
  0.087731;0.955303;,
  0.022500;0.044697;,
  0.042731;0.044697;,
  0.042731;0.955303;,
  0.022500;0.955303;,
  0.087731;0.955303;,
  0.087731;0.044697;,
  0.022500;0.022500;,
  0.977500;0.044697;,
  0.042731;-0.022500;,
  0.087731;-0.022500;,
  0.087731;1.044697;,
  0.042731;1.044697;,
  0.022500;0.044697;,
  0.046019;0.044697;,
  0.046019;0.955303;,
  0.022500;0.955303;,
  0.091019;0.955303;,
  0.091019;0.044697;,
  0.977500;0.977500;,
  0.977500;0.044697;,
  0.091019;0.022500;,
  0.046019;0.022500;,
  0.953982;0.044697;,
  0.908981;0.044697;,
  0.953981;0.044697;,
  0.977500;0.044697;,
  0.977500;0.955303;,
  0.953981;0.955303;,
  0.977500;0.977500;,
  0.022500;0.955303;,
  0.908981;0.044697;,
  0.908981;0.955303;,
  0.953981;1.022500;,
  0.908981;1.022500;,
  0.908981;-0.044697;,
  0.953981;-0.044697;,
  0.042298;0.044697;,
  0.042298;0.955303;,
  0.087297;0.955303;,
  0.087297;0.044697;,
  0.087297;-0.022500;,
  0.087297;0.022500;,
  0.022500;0.109494;,
  -0.022500;0.109494;,
  0.957703;0.044697;,
  1.022500;0.109494;,
  0.977500;0.109494;,
  0.912703;0.022500;,
  0.912703;-0.022500;,
  0.957703;0.955303;,
  0.912703;0.955303;,
  0.912703;0.044697;,
  0.959860;0.044697;,
  -0.022500;0.982057;,
  0.959860;-0.022500;,
  0.959860;0.022500;,
  0.022500;0.982057;,
  0.959860;0.955303;,
  0.914860;0.044697;,
  0.914860;0.955303;,
  0.959860;0.977500;,
  0.959860;1.022500;,
  -0.022500;0.017943;,
  0.022500;0.017943;,
  0.040140;0.044697;,
  0.085140;0.044697;,
  0.040140;0.955303;,
  0.085140;0.955303;,
  0.899977;0.044697;,
  1.022500;0.167220;,
  0.987415;0.167220;,
  0.854977;0.012585;,
  0.854977;-0.022500;,
  0.100023;0.044697;,
  0.135108;0.044697;,
  0.899977;0.955303;,
  0.864892;0.044697;,
  0.864892;0.955303;,
  0.854977;1.022500;,
  0.854977;0.987415;,
  0.987415;0.832780;,
  1.022500;0.832780;,
  0.100023;0.955303;,
  0.135108;0.955303;,
  0.099739;0.044697;,
  0.134824;0.044697;,
  0.099739;0.955303;,
  0.134824;0.955303;,
  0.865176;0.044697;,
  0.900261;0.044697;,
  0.865176;0.955303;,
  0.900261;0.955303;,
  0.100831;0.044697;,
  0.145831;0.044697;,
  0.899169;0.044697;,
  0.145831;0.044697;,
  0.100831;0.044697;,
  0.899169;0.022500;,
  0.854169;0.022500;,
  0.100831;0.955303;,
  0.145831;0.955303;,
  0.899169;0.955303;,
  0.854169;0.044697;,
  0.854169;0.955303;,
  0.854169;0.977500;,
  0.899169;0.977500;,
  0.100831;0.955303;,
  0.145831;0.955303;,
  0.848596;0.044697;,
  0.893596;0.044697;,
  0.106404;0.044697;,
  0.151404;0.044697;,
  0.848596;0.955303;,
  0.893596;0.955303;,
  0.106404;0.955303;,
  0.151404;0.955303;;
 }
}