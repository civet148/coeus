package keeper

import (
	"github.com/civet148/coeus-node/x/coeus/types"
)

var _ types.QueryServer = Keeper{}
