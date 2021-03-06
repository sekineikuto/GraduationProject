// ===================================================================
//
// 接続UIの基盤処理 [ connectBase.h ]
// Author : KANAN NAGANAWA
//
// ===================================================================
#ifndef _CONNECTBASE_H_
#define _CONNECTBASE_H_

#define _CRT_SECURE_NO_WARNINGS // 警告除去

// ===================================================================
// インクルードファイル
// ===================================================================
#include "main.h"
#include "scene.h"

// ===================================================================
// マクロ定義
// ===================================================================

// ===================================================================
// クラス定義
// ===================================================================
class CConnectUI;

class CConnectBase : public CScene
{
public:
	CConnectBase();
	~CConnectBase();

	virtual HRESULT Init(void);			// 初期化
	virtual void Update(void);			// 更新
	virtual void Draw(void);			// 描画
	virtual void ShowDebugInfo() {};		//デバッグ情報表記

	static std::shared_ptr<CConnectBase> Create(void);	// 生成

private:
	CConnectUI *m_pUI;	// UIのポインタ
};

#endif
