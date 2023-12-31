package main

import (
	"fmt"
	"github.com/cosmos/cosmos-sdk/version"
	"os"

	"github.com/cosmos/cosmos-sdk/server"
	svrcmd "github.com/cosmos/cosmos-sdk/server/cmd"

	"github.com/civet148/coeus/app"
	"github.com/civet148/coeus/cmd/coeusd/cmd"
)

const (
	Version = "v0.4.0"
)

var (
	BuildTime = "2023-10-24"
	GitCommit = ""
)

func main() {
	version.Version = fmt.Sprintf("%s %s %s", Version, BuildTime, GitCommit)
	rootCmd, _ := cmd.NewRootCmd()
	if err := svrcmd.Execute(rootCmd, "", app.DefaultNodeHome); err != nil {
		switch e := err.(type) {
		case server.ErrorCode:
			os.Exit(e.Code)

		default:
			os.Exit(1)
		}
	}
}
