//go:build !windows && !linux

package bundle

func ensureExtracted() (string, error) {
	return "", nil
}

func toolPath(name string) (string, error) {
	return name, nil
}

func projDataPath() (string, error) {
	return "", nil
}
