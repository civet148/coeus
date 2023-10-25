package keeper_test

import (
	"context"
	"testing"

	keepertest "github.com/civet148/coeus/testutil/keeper"
	"github.com/civet148/coeus/x/coeus/keeper"
	"github.com/civet148/coeus/x/coeus/types"
	sdk "github.com/cosmos/cosmos-sdk/types"
	"github.com/stretchr/testify/require"
)

func setupMsgServer(t testing.TB) (types.MsgServer, context.Context) {
	k, ctx := keepertest.CoeusKeeper(t)
	return keeper.NewMsgServerImpl(*k), sdk.WrapSDKContext(ctx)
}

func TestMsgServer(t *testing.T) {
	ms, ctx := setupMsgServer(t)
	require.NotNil(t, ms)
	require.NotNil(t, ctx)
}
