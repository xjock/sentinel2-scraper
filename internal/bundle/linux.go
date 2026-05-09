//go:build linux

package bundle

import (
	"os"
	"path/filepath"
)

func appDir() string {
	if d := os.Getenv("APPDIR"); d != "" {
		return d
	}
	return ""
}

func ensureExtracted() (string, error) {
	return "", nil
}

func toolPath(name string) (string, error) {
	if d := appDir(); d != "" {
		return filepath.Join(d, "usr", "bin", name), nil
	}
	return name, nil
}

func projDataPath() (string, error) {
	if d := appDir(); d != "" {
		return filepath.Join(d, "usr", "share", "proj"), nil
	}
	return "", nil
}
