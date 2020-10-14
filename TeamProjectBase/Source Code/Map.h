//------------------------------------------------------------------------------
//
//マップ処理  [map.h]
//Author:Yoshiki Hosoya
//
//------------------------------------------------------------------------------
#ifndef _MAP_H_
#define _MAP_H_
//------------------------------------------------------------------------------
//インクルード
//------------------------------------------------------------------------------
#include "main.h"
#include "scene.h"
#include "Mylibrary.h"

//------------------------------------------------------------------------------
//マクロ
//------------------------------------------------------------------------------
class CMesh;

//------------------------------------------------------------------------------
//クラス定義
//------------------------------------------------------------------------------
class CMap
{
public:
	CMap();
	~CMap();

	static std::unique_ptr<CMap> Create();							//生成処理
	static D3DXVECTOR3 GetFieldSize();
protected:
private:

	static void CreateField(D3DXVECTOR3 size, INTEGER2 BlockNum);
	static void CreateWall(INTEGER2 BlockNum);
};
#endif