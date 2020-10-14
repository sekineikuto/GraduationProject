//------------------------------------------------------------------------------
//
//メッシュフィールド処理  [meshfield.cpp]
//Author:Yoshiki Hosoya
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//インクルード
//------------------------------------------------------------------------------
#include "mesh.h"
#include "renderer.h"
#include "manager.h"
#include "renderer.h"
#include "keyboard.h"
#include "camera.h"
#include "meshcircle.h"

//------------------------------------------------------------------------------
//マクロ
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//静的メンバ変数の初期化
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//コンストラクタ
//------------------------------------------------------------------------------
CMeshCircle::CMeshCircle()
{
	//初期化
	m_fRadius = 0.0f;
	m_fWidth = 0.0f;
}

//------------------------------------------------------------------------------
//デストラクタ
//------------------------------------------------------------------------------
CMeshCircle::~CMeshCircle()
{

}
//------------------------------------------------------------------------------
//初期化処理
//------------------------------------------------------------------------------
HRESULT CMeshCircle::Init()
{
	CMesh::Init();

	return S_OK;

}
//------------------------------------------------------------------------------
//終了処理
//------------------------------------------------------------------------------
void CMeshCircle::Uninit()
{
	CMesh::Uninit();
}
//------------------------------------------------------------------------------
//更新処理
//------------------------------------------------------------------------------
void CMeshCircle::Update()
{
	CMesh::Update();
}
//------------------------------------------------------------------------------
//描画処理
//------------------------------------------------------------------------------
void CMeshCircle::Draw()
{
	//マトリックス計算
	CHossoLibrary::CalcMatrix(GetMtx(), GetPos(), GetRot());

	//描画
	CMesh::Draw();
}
//------------------------------------------------------------------------------
//デバッグ情報表記
//------------------------------------------------------------------------------
void CMeshCircle::ShowDebugInfo()
{
#ifdef _DEBUG

	CMesh::ShowDebugInfo();

#endif //DEBUG
}
//------------------------------------------------------------------------------
//生成
//------------------------------------------------------------------------------
std::shared_ptr<CMeshCircle> CMeshCircle::Create(D3DXVECTOR3 const pos, float fRadius, float fWidth, INTEGER2 const BlockNum)
{
	//メモリ確保
	std::shared_ptr<CMeshCircle> pMesh(new CMeshCircle);

	//nullcheck
	if (pMesh)
	{
		//初期化
		pMesh->Init();
		pMesh->SetPos(pos);
		pMesh->m_fRadius = fRadius;
		pMesh->m_fWidth = fWidth;
		pMesh->SetBlockNum(BlockNum);

		//頂点生成
		pMesh->MakeVertex();

		//テクスチャ設定
		pMesh->BindTexture(CTexture::GetTexture(CTexture::TEX_NONE));

		//Sceneの配列追加
		pMesh->SetObjType(CScene::OBJTYPE_MESHFIELD);
		pMesh->AddSharedList(pMesh);
	}

	return pMesh;
}

//------------------------------------------------------------------------------
//頂点設定
//------------------------------------------------------------------------------
D3DXVECTOR3 CMeshCircle::SetVtx(INTEGER2 nCnt, INTEGER2 BlockNum)
{
	//角度を求める
	float fRot = (D3DX_PI * 2) / BlockNum.nX;

	//座標設定
	return D3DXVECTOR3(sinf(fRot * nCnt.nX) * (m_fRadius + m_fWidth * nCnt.nY),
							//m_fWidth * nCnt.y,
							0.1f,
							cosf(fRot * nCnt.nX) * (m_fRadius + m_fWidth * nCnt.nY));

}
